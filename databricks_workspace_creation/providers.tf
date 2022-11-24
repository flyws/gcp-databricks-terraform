terraform {
 required_providers {
   databricks = {
     source  = "databricks/databricks"
   }
 }
}
 
provider "google" {
 project = var.project
}
 
provider "databricks" {
 alias                  = "accounts"
 host                   = "https://accounts.gcp.databricks.com"
 google_service_account = var.databricks_google_service_account
}