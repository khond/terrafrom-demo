variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "launch_template_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}
