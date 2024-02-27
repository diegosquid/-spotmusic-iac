resource "aws_ecr_repository" "spotmusic_ecr" {
 name        = var.ecr_repository_name
 image_tag_mutability = "MUTABLE"
}

output "repository_url" {
  value = aws_ecr_repository.spotmusic_ecr.repository_url
}
