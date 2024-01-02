

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["subnet-fb7f12a0", "subnet-f0311bb9"] # Vervang door je eigen subnet-IDs

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_security_group" "allow_postgresql" {
  name        = "allow_postgresql"
  description = "Allow PostgreSQL inbound traffic"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Pas dit aan om veiligheidsredenen
  }
}

module "db_instance" {
  source = "./modules/db_instance"
    identifier           = local.name
    allocated_storage    = local.config.SizeStorage
    storage_type         = var.storage_type
    engine               = var.engine
    engine_version       = var.engine_version
    instance_class       = local.config["InstanceClass"]
    username             = jsondecode(aws_secretsmanager_secret_version.db_secret.secret_string)["username"]
    password             = jsondecode(aws_secretsmanager_secret_version.db_secret.secret_string)["password"]
    parameter_group_name = module.db_parameter_group.db_parameter_group
    vpc_security_group_ids = aws_security_group.allow_postgresql.id
    db_subnet_group_name = aws_db_subnet_group.default.id
    tags                 = local.tags
}


################################################################################
# DB Database
################################################################################
module "db_database" {
  source = "./modules/db_database"
    db_name                 = local.config.DbName
    owner                   = var.owner
    username                = jsondecode(aws_secretsmanager_secret_version.db_secret.secret_string)["username"]
    password                = jsondecode(aws_secretsmanager_secret_version.db_secret.secret_string)["password"]
    tablespace_name         = var.tablespace_name
    connection_limit        = var.connection_limit 
    allow_connections       = var.allow_connections
    is_template             = var.is_template
    template                = var.template
    encoding                = var.encoding
    lc_collate              = local.config.Collation
    lc_ctype                = var.lc_ctype
    host                    = split(":", module.db_instance.rds_endpoint)[0]

    # depends_on = [ module.db_instance ]
}

################################################################################
# DB Database Parameter Group
################################################################################
module "db_parameter_group" {
  source = "./modules/db_parameter_group"
    name = local.name
    family = var.family

    parameters = [ {
      name = var.encoding
    } ]
  tags                 = local.tags
}

################################################################################
# DB Database credentials
# ################################################################################

resource "aws_secretsmanager_secret" "postgres_master_account" {
  name        = "postgres_master_account"
  description = "Postgres master account credentials"
    lifecycle {
    prevent_destroy = false
  }

  recovery_window_in_days = 0
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&()*+,-.:;<=>?[]^_{|}~"
}

resource "aws_secretsmanager_secret_version" "db_secret" {
  secret_id = aws_secretsmanager_secret.postgres_master_account.id
  secret_string = jsonencode({
    username = "dbaasadmin1"
    password = random_password.password.result
  })
}

