resource "aws_ecs_service" "app_service" {
  name            = "clever-tap-nginx-service"     # Name the service
  cluster         = "clevertap"   # Reference the created Cluster
  task_definition = "wordpress" # Reference the task that the service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Set up the number of containers to 3


  network_configuration {
    subnets          = ["subnet-0ca21cea6808ec333"]
    assign_public_ip = true     # Provide the containers with public IPs
    security_groups  = ["sg-0c15215968655881f"] # Set up the security group
  }
}
