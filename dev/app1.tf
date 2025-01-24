provider "aws" {
  region = "us-east-1"
}

module "keypair" {
  source = "../modules/keypair"
  pem_file_name = "devkeytest.pem"
  the_key_name = "devkeytest"
  subnet_id = "subnet-056345b1f536cebcf"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "devapp1"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1a"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "ec2-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-073b5a096f669ec12"]
  subnet_id              = "subnet-058f3086e8a4afc73"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
  