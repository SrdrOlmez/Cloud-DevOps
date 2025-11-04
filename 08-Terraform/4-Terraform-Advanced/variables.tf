variable "resource_group_name" {
  default = "tf-advanced-rg"
}

variable "location" {
  default = "West Europe"
}

variable "sql_server_name" {
  default = "tf-sqlserver-demo"
}

variable "sql_admin_login" {
  default = "sqladminuser"
}

variable "sql_admin_password" {
  default = "Password123!"
}

variable "sql_db_name" {
  default = "tf-sample-db"
}

variable "storage_account_name" {
  default = "tfstorageexample123"
}

variable "storage_container_name" {
  default = "appdata"
}

