variable "db_name" {
    description = "Name of the database"
    type = string
}

variable "owner" {
    description = "The role name of the user who will own the database"
    type = string
}

variable "tablespace_name" {
    description = "The name of the tablespace that will be associated with the database"
    type = string
}

variable "connection_limit" {
    description = "How many concurrent connections can be established to this database"
    type = number

}

variable "allow_connections" {
  description = "(Optional) If false then no one can connect to this database"
  type = bool
}

variable "is_template" {
  description = "If true, then this database can be cloned by any user with CREATEDB privileges"
  type        = bool
  default     = false
}

variable "template" {
  description = "The name of the template database"
  type        = string
  default     = null
}

variable "encoding" {
  description = "Character set encoding to use in the database"
  type        = string
  default     = null
}

variable "lc_collate" {
  description = " Collation order (LC_COLLATE) to use in the database"
  type        = string
  default     = null
}

variable "lc_ctype" {
  description = "Character classification (LC_CTYPE) to use in the database"
  type        = string
  default     = null
}

variable "username" {
  description = "username"
  type = string
}

variable "password" {
  description = "password"
  type = string
}

variable "host" {
  description = "host of instance endpoint"
  type = string
}

variable "port" {
  description = "port"
  type = number
  default = 5432
}