resource "aws_db_parameter_group" "this" {
  name   = var.name
  family = var.family

  parameter {
    name  = "client_encoding"
    value = "utf8"
  }

  parameter {
    name  = "log_statement"
    value = "all"
  }

  # Voeg meer parameters toe zoals nodig

 tags = var.tags
}