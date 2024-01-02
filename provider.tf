provider "aws" {
  region     = var.aws_region
}

provider "postgresql" {
  host            = module.db_instance.rds_endpoint
  port            = 5432
  username        = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["username"]
  password        = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["password"]
  superuser       = false
  sslmode         = "require"
  connect_timeout = 15
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
    }
  }
}