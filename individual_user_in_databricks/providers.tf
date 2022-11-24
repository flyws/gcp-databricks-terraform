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
 token                  = var.workspace_token
}