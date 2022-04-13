module "networking" {
  source = "./modules/01-Networking"
  az_1   = data.aws_availability_zones.available_az.names[0]
  az_2   = data.aws_availability_zones.available_az.names[1]
  az_3   = data.aws_availability_zones.available_az.names[2]
}
