resource "aws_ecs_task_definition" "main" {
  family                   = "tdef-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.task_service_for}-${var.seq_id}-${random_string.main.result}"
  network_mode             = var.network_mode
  memory                   = var.task_memory
  cpu                      = var.task_cpu
  container_definitions    = "${file("${path.root}/${var.location_of_container_defn}")}"
  execution_role_arn       = var.task_definition_execution_role_arn
  requires_compatibilities = var.requires_compatibilities

  tags = merge(
    var.common_tags,
    var.tags_for_task_defination,
    {
      Name        = "tdef-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.task_service_for}-${var.seq_id}-${random_string.main.result}"
      RegionId    = var.region_id
      Environment = var.environment
      CostCentre  = var.cost_centre
      VPCSeqId    = var.vpc_seq_id
      VersionId   = var.version_id
      BuildDate   = var.build_date
      AppRole     = "compute"
    }
  )
}



# resource "aws_ecs_task_definition" "airflow" {
#   family                    = "airflow"
#   container_definitions     = data.template_file.airflow.rendered
#   memory                    = 2048
#   cpu                       = 1024
#   network_mode              = "awsvpc"
#   execution_role_arn        = var.airflow_task_definition_execution_role_arn
#   requires_compatibilities  = ["EC2"]

#   volume {
#     name      = "requirements"
#     host_path = "/home/ec2-user/airflow/docker/requirements.txt"
#   }

#   volume {
#     name      = "dags"
#     host_path = "/home/ec2-user/airflow/dags"
#   }
# }