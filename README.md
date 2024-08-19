# terrafrom-demo

terraform/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── subnet/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── nat_gateway/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── security_group/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── launch_template/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── autoscaling_group/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── load_balancer/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
