resource "aws_db_instance" "default" {
  identifier           = var.identifier
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password # Verander dit naar een sterk wachtwoord
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
  publicly_accessible  = true

  vpc_security_group_ids = [var.vpc_security_group_ids]
  db_subnet_group_name   = var.db_subnet_group_name

  tags = var.tags
}