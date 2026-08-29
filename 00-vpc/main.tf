module "vpc" {
    source = "git::https://github.com/pavithrakasukurthi/vpc-module.git"

    project = var.project
    environment = var.environment
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr
}