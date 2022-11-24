// add users to the workspace, by default there is only one service account
data "databricks_group" "admins" {
 provider     = databricks.workspace
 display_name = "admins"
}
 
resource "databricks_user" "your_list" {
 provider     = databricks.workspace
 for_each = toset( var.email_list )
 user_name = each.key
}
 
resource "databricks_group_member" "allow_me_to_login" {
 provider     = databricks.workspace
 depends_on = [ databricks_user.your_list ]
 group_id  = data.databricks_group.admins.id

 for_each = databricks_user.your_list
 member_id = each.value.id
}

# output "group_id" {
#  value = databricks_user.your_list["flyws1993@gmail.com"].id
# }
