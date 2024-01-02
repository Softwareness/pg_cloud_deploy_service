provider "postgresql" {
  host            = var.host
  port            = var.port
  username        = var.username
  password        = var.password
  sslmode         = "require"
  connect_timeout = 15
}

resource "postgresql_database" "this" {
    name                    = var.db_name
    //owner                   = var.owner
    //tablespace_name         = var.tablespace_name
    connection_limit        = var.connection_limit 
    allow_connections       = var.allow_connections 
    is_template             = var.is_template 
    template                = var.template
    encoding                = var.encoding
    lc_collate              = var.lc_collate
    lc_ctype                = var.lc_ctype
}

