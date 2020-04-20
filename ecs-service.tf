resource "aws_ecs_service" "ecs-service" {
  #ToDo
  # ordered_placement_strategy
  # placement_constraints
  # lifecycle ignore changes
  name            = "svc-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.task_service_for}-${var.seq_id}-${random_string.main.result}"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.desire_count
  # This parameter is required if you are using a load balancer with your service, 
  #but only if your task definition does not use the awsvpc network mode. 
  #If using awsvpc network mode, do not specify this role. 
  # If your account has already created the Amazon ECS service-linked role,
  # that role is used by default for your service unless you specify a role here
  iam_role   = var.ecs_role_arn
  depends_on = [var.service_task_def_depends_on]

  load_balancer {
    #needed only of load balancer is classic  
    #elb_name         = var.classical_elb_name
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  lifecycle {
    #ignore_changes = ["task_definition"]
  }
}
