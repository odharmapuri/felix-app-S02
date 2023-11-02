provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  #shared_credentials_files = ["/Users/rwagh/.aws/credentials"]
}
#Modules
module "vpc" {
  source  = "./modules/vpc"
  zone1a  = var.zone1a
  zone1b  = var.zone1b
  project = var.project
}
module "ec2" {
  source     = "./modules/ec2"
  sn1        = module.vpc.sn1
  work-sg    = module.vpc.work-sg
  project    = var.project
  ubuntu     = var.ubuntu
  key-pair   = var.key-pair
}
module "s3" {
  source  = "./modules/s3"
  project = var.project
}
