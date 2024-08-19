output "alb_arn" {
  value = aws_lb.web_alb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.web_tg.arn
}
