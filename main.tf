module "vpc" {
   source = "git::https://github.com/Pavanyandrapati/tf-module-vpc.git"

  for_each = var.vpc
  cidr_block = each.value["cidr_block"]
  tags = local.tags

}