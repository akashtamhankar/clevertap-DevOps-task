resource "aws_ecs_task_definition" "wordpress" {
  family                   = "new-wordpress"
  container_definitions    = <<DEFINITION
  [
    {
      "name": "wordpress",
      "image": "555642844971.dkr.ecr.ap-south-1.amazonaws.com/wordpress:latest",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ],
      "mountPoints": [
          {
            "sourceVolume": "efs-volume",
            "containerPath": "/wp-content/uploads/",
            "readOnly": null
          }
      ],
      "memory": 512,
      "cpu": 256
}
]
  
  DEFINITION
  requires_compatibilities = ["FARGATE"] 
  network_mode             = "awsvpc"    
  memory                   = 512        
  cpu                      = 256     
  volume {
    name = "efs-volume"
    efs_volume_configuration {
      file_system_id = "fs-079554ba600094bcf"
      root_directory = "/"
  
    }
  }
}

