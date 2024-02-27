# Módulos
module "spotmusic_vpc" {
  source = "./modules/vpc"
}

module "spotmusic_ecr" {
  source = "./modules/ecr"
}

module "spotmusic_ecs" {
  source = "./modules/ecs"
  depends_on = [
    module.spotmusic_vpc,
    module.spotmusic_ecr,
  ]
}

module "spotmusic_dynamodb" {
  source = "./modules/dynamodb"
  depends_on = [
    module.spotmusic_vpc,
  ]
}

module "spotmusic_api_gateway" {
  source = "./modules/api_gateway"
  depends_on = [
    module.spotmusic_vpc,
    module.spotmusic_ecs,
  ]
}