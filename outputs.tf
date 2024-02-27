output "spotmusic_vpc_id" {
  value = module.spotmusic_vpc.vpc_id
}

output "spotmusic_ecs_service_arn" {
  value = module.spotmusic_ecs.service_arn
}

output "spotmusic_dynamodb_table_name" {
  value = module.spotmusic_dynamodb.table_name
}

output "spotmusic_api_gateway_url" {
  value = module.spotmusic_api_gateway.api_gateway_url
}