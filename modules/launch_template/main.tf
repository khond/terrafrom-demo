resource "aws_launch_template" "web_launch_template" {
  name_prefix   = "web-server-"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.key_name

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1.12 -y
              systemctl start nginx
              systemctl enable nginx
              echo "<html><h1>Hello from Nginx on Amazon Linux 2!</h1></html>" > /usr/share/nginx/html/index.html
              EOF
  )

  network_interfaces {
    security_groups           = [var.security_group_id]
    associate_public_ip_address = true
  }
}

output "launch_template_id" {
  value = aws_launch_template.web_launch_template.id
}
