module "vpc" {
  source                  = "../../terraform-aws-vpc"
  cidr_block              = "10.0.0.0/16"
  private_subnet_cidrs    = ["10.0.11.0/24", "10.0.12.0/24"]
  db_private_subnet_cidrs = ["10.0.21.0/24", "10.0.22.0/24"]
  public_subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]
  env                     = var.env
  is_peering_required     = true
  project                 = var.project
  region                  = "us-east-1"
}