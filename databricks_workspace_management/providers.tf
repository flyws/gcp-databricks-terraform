terraform {
 required_providers {
   databricks = {
     source  = "databricks/databricks"
   }
 }
}

provider "databricks" {
 alias                  = "workspace"
 host                   = var.workspace_url
 google_service_account = var.databricks_google_service_account
}