# gcp-databricks-terraform
This is an example repository that contains Terraform scripts for GCP Databricks management. It is comprised of 4 parts:
1. GCP Service Account for Databricks  
You need a GCP Service Account to make use of Databricks Terraform Provider for GCP. Specifically this Service Account is used for workspace creation 
and manage users on account console, but it can also be used to manage assets on individual workspaces.
2. GCP Databricks workspace creation  
To create a workspace on GCP Databricks, one can go via the account console way where it will make use of your user's IAM permissions. And this is an
alternative way where you can automate the workspace creation with a Service Account.
3. GCP Databricks workspace management  
Once you have a workspace, you might want to manage it using a centralized Service Account. This is not a problem because the above Service Account will 
then be added to the workspace as an admin, which can now manage things centrally.
4. Individual user's Terraform usage  
The above 3 points are about how admins can centrally manage Databricks assets. However in this component we introduce how individual workspace user can 
utilize their Databricks personal tokens to manage assets within their own permission scope.

# Requirements
- You must have Account API preview enabled for your GCP Databricks account. (this will not be necessary once the API goes public preview / generally available)
- You must have enough permissions to create Service Account and assign permissions for a GCP Project.
- You have used Terraform before and know how to authenticate with GCP Terraform provider. 

# Guide
To run this example scripts, clone the relevant folder to your environment and run `terraform init` to initialize your terraform. Do note that you will have to modify the values in `.tfvars` files so that it can be tailored to your GCP account and GCP Databricks account.
