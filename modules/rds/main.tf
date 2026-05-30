resource "aws_db_subnet_group" "db" {
  name       = "my-db-subnet-group"
  subnet_ids = var.private_subnets
} 

resource "aws_security_group" "rds" {
  name   = "rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "db" {
  identifier         = "my-mysql-db"

  engine             = "mysql"
  engine_version     = "8.0"

  instance_class     = "db.t3.micro"
  allocated_storage  = 20

  username = "admin"
  password = "password123"

  multi_az            = true
  skip_final_snapshot = true

  publicly_accessible = false

  db_subnet_group_name   = aws_db_subnet_group.db.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}
