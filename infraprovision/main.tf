module "chatapp-vpc" {
  source = "./modules/vpc"

  region               = "us-east-2"
  vpc_cidr             = "10.10.0.0/16"
  name                 = "chatapp-vpc"
  env                  = "project"
  public_subnets_cidr  = ["10.10.0.0/24"]
  private_subnets_cidr = ["10.10.1.0/24"]
  availability_zones   = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

module "sgsofinstances" {
  source = "./modules/sgs"
  
}
module "ec2instances" {
  source = "./modules/ec2"
}

