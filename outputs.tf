output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.subnet.public_subnet_ids
}

output "private_subnet_id" {
  value = module.subnet.private_subnet_id
}

output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}

output "alb_arn" {
  value = module.load_balancer.alb_arn
}

output "asg_name" {
  value = module.autoscaling_group.asg_name
}
