resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "project-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "project-db-subnet-group"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "project-db-sg"
  description = "Allow EC2 to access RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]   # Allow EC2 SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "my_rds" {
  identifier              = "project-mysql-db"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  skip_final_snapshot     = true
}
