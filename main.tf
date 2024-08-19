provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "nat_gateway" {
  source   = "./modules/nat_gateway"
  vpc_id   = module.vpc.vpc_id
  subnet_id = module.subnet.public_subnet_ids[0]
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "launch_template" {
  source = "./modules/launch_template"
  ami_id  = data.aws_ami.amazon_linux.id
  key_name = "my-key"  # Replace with your key name
  security_group_id = module.security_group.ec2_sg_id
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.subnet.public_subnet_ids
  launch_template_id = module.launch_template.launch_template_id
  target_group_arn = module.load_balancer.target_group_arn
}

module "load_balancer" {
  source = "./modules/load_balancer"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.subnet.public_subnet_ids
  security_group_id = module.security_group.alb_sg_id
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
