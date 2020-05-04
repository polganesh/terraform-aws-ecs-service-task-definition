resource "aws_ecs_task_definition" "main" {
  family                   = "tdef-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.task_service_for}-${var.seq_id}"
  network_mode             = var.network_mode
  memory                   = var.task_memory
  cpu                      = var.task_cpu
  container_definitions    = data.template_file.container-defn-data.rendered
  execution_role_arn       = var.task_definition_execution_role_arn
  requires_compatibilities = var.requires_compatibilities
  depends_on=[aws_cloudwatch_log_group.main]

  dynamic "volume" {
    for_each = var.volumes
    content {
      name      = volume.value.name
      host_path = volume.value.host_path
    }
  }

  tags = merge(
    var.common_tags,
    var.tags_for_task_defination,
    {
      Name        = "tdef-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.task_service_for}-${var.seq_id}"
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
