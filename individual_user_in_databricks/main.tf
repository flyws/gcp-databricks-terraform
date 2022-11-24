data "databricks_current_user" "me" {
 provider = databricks.workspace
}
 
data "databricks_spark_version" "latest" {
 provider = databricks.workspace
}
 
data "databricks_node_type" "smallest" {
 provider   = databricks.workspace
 local_disk = true
}
 
resource "databricks_notebook" "this" {
 
 provider = databricks.workspace
 path     = "${data.databricks_current_user.me.home}/Terraform"
 language = "PYTHON"
 content_base64 = base64encode(<<-EOT
   # created from ${abspath(path.module)}
   display(spark.range(10))
   EOT
 )
}
 
# resource "databricks_cluster" "this" {
#  provider                = databricks.workspace
#  cluster_name            = "Shared Autoscaling  (by ${data.databricks_current_user.me.alphanumeric})"
#  spark_version           = data.databricks_spark_version.latest.id
#  node_type_id            = data.databricks_node_type.smallest.id
#  autotermination_minutes = 20
#  autoscale {
#    min_workers = 1
#    max_workers = 10
#  }
# }
 
resource "databricks_job" "this" {
 provider            = databricks.workspace
 name                = "Terraform Demo (${data.databricks_current_user.me.alphanumeric})"
 existing_cluster_id = var.existing_cluster_id
 notebook_task {
   notebook_path = databricks_notebook.this.path
 }
}
 
output "notebook_url" {
 value = databricks_notebook.this.url
}
 
output "job_url" {
 value = databricks_job.this.url
}
