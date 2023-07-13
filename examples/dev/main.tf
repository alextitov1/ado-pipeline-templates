resource "random_string" "this_default" {
  length  = 8
  special = false
  upper   = false
  numeric = true
}

module "resource_group_default" {
  source   = "./modules/"
  name     = format("tfrgtest-%s", random_string.this_default.result)
  location = "australiaeast"
  tags = {
    ManagedBy = "Terraform",
    Test      = random_string.this_default.result
  }
}