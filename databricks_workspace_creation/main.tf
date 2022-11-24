resource "databricks_mws_workspaces" "this" {
 provider       = databricks.accounts
 account_id     = var.databricks_account_id
 workspace_name = "shuwu-demo"
 location       = var.location
 
 cloud_resource_bucket {
   gcp {
     project_id = var.project
   }
 }
}
