name = "prod-3tier"

cidr = "10.0.0.0/16"

azs = ["us-east-1a", "us-east-1b"]

public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

certificate_arn = "arn:aws:acm:us-east-1:XXXX:certificate/XXXX"