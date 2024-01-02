# output "rds_endpoint" {
#   value = aws_db_instance.default.endpoint.Address
# }

output "rds_endpoint" {
  value = split(":", aws_db_instance.default.endpoint)[0]
}
