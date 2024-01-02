variable "client_encoding" {
  description = "Client encoding"
  type = string
  default = "utf8"
}

variable "name" {
  description = "Name of the DB parameter group"
  type        = string
}

variable "family" {
  description = "The database parameter group family"
  type        = string
  default = "postgres15"
}

variable "parameters" {
  description = "List of parameter maps"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "Tags for resources"
  type = map(string)
  default = {}
}