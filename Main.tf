module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs             = ["ap-south-1a", "ap-south-1b"]
}


module "ec2" {
  source = "./modules/Ec2"

  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
}

module "s3" {
  source      = "./modules/S3"
  bucket_name = "my-project-backup-bucket-12345"
}

module "rds" {
  source = "./modules/RDS"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ec2_sg_id          = module.ec2.web_sg_id

  db_username = "admin"
  db_password = "Admin1234!"     # for testing only
}

module "cloudwatch" {
  source = "./modules/Cloudwatch"

  ec2_instance_id = module.ec2.instance_id
  db_instance_id  = module.rds.db_instance_id
}
