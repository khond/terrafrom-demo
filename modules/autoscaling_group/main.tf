resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [desired_capacity, min_size, max_size]
  }

  target_group_arns = [var.target_group_arn]
}

output "asg_name" {
  value = aws_autoscaling_group.web_asg.name
}
