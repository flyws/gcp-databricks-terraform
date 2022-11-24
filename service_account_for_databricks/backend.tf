terraform {
 backend "gcs" {
   bucket  = "shu_terraform_use"
   prefix  = "gcp-databricks-terraform/service_account_for_databricks/state"
 }
}