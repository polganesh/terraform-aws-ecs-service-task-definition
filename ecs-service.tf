resource "aws_ecs_service" "ecs-service" {
  #ToDo
  # ordered_placement_strategy
  # placement_constraints
  name            = "svc-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.task_service_for}-${var.seq_id}"
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

  dynamic "load_balancer" {
    for_each = var.load_balancers
    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }
}
