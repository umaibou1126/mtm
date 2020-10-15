# ====================
# Cluster
# ====================
resource "aws_ecs_cluster" "terraform-cluster" {
  name = "terraform-cluster"
}

# ====================
# CloudWatch logs
# ====================
resource "aws_cloudwatch_log_group" "terraform-log-group" {
  name = "terraform-log-group"
  tags = {}
}

# ====================
# task_definition
# ====================
resource "aws_ecs_task_definition" "terraform-task-definition" {
  //family：複数のタスク定義をまとめる際に使用
  family                   = "terraform-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  task_role_arn            = "arn:aws:iam::${var.aws_account_id}:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::${var.aws_account_id}:role/ecsTaskExecutionRole"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = file("files/task-definitions/container.json")
}

# ====================
# Service
# ====================
resource "aws_ecs_service" "terraform-service" {
  cluster                            = aws_ecs_cluster.terraform-cluster.id
  launch_type                        = "FARGATE"
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  name                               = "terraform-service"
  task_definition                    = aws_ecs_task_definition.terraform-task-definition.arn
  //desired_count：タスク数
  desired_count = 1

  //autoscalingで動的に変化する値を無視する
  lifecycle {
    ignore_changes = [desired_count, task_definition]
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.terraform-target-group.arn
    container_name   = "terraform-container"
    container_port   = 80
  }

  network_configuration {
    subnets          = [aws_subnet.terraform-subnet-1.id, aws_subnet.terraform-subnet-2.id]
    security_groups  = [aws_security_group.terraform-security-group-app.id, aws_security_group.terraform-security-group-rds.id]
    assign_public_ip = "true"
  }
}

