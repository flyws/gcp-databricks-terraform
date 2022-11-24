terraform {
 backend "gcs" {
   bucket  = "shu_terraform_use"
   prefix  = "gcp-databricks-terraform/individual_user_in_databricks/state"
 }
}