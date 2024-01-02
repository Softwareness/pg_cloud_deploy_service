output "db_parameter_group" {
  description = "Parameter group name"
  value = aws_db_parameter_group.this.name
}