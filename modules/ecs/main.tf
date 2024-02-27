resource "aws_ecs_cluster" "spotmusic_ecs" {
 name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "spotmusic_task" {
 family         = "spotmusic-task"
 network_mode      = "awsvpc"
 requires_compatibilities = ["FARGATE"]
 cpu           = "256"
 memory         = "512"
 execution_role_arn   = aws_iam_role.ecs_task_execution_role.arn
 container_definitions  = jsonencode([
  {
   name   = "spotmusic-container"
   image  = "${aws_ecr_repository.spotmusic_ecr.repository_url}:latest"
   cpu   = 256
   memory  = 512
   essential = true
   portMappings = [
    {
     containerPort = 80
     hostPort   = 80
     protocol   = "tcp"
    }
   ]
  }
 ])
}

resource "aws_ecs_service" "spotmusic_ecs_service" {
 name      = "spotmusic-service"
 cluster    = aws_ecs_cluster.spotmusic_ecs_cluster.id
 task_definition = aws_ecs_task_definition.spotmusic_task.arn
 launch_type  = "FARGATE"

 network_configuration {
  subnets = [aws_subnet.spotmusic_subnet.id]
  security_groups = [aws_security_group.spotmusic_sg.id]
 }

 load_balancer {
  target_group_arn = aws_lb_target_group.spotmusic_target_group.arn
  container_name = "spotmusic-container"
  container_port = 80
 }
}

output "service_arn" {
  value = aws_ecs_service.spotmusic_ecs_service.arn
}