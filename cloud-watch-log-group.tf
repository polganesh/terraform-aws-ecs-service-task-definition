resource "aws_cloudwatch_log_group" "nginx" {
  count             = "${var.is_require_cw_lgrp == "true" ? 1 : 0}"
  name              = "cwlgrp-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.task_service_for}-${var.seq_id}"
  retention_in_days = var.cw_lgrp_retention_in_days
  tags = merge(
    var.common_tags,
    var.tags_for_cw_lgrp,
    {
      Name        = "cwlgrp-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.task_service_for}-${var.seq_id}"
      RegionId    = var.region_id
      Environment = var.environment
      CostCentre  = var.cost_centre
      VPCSeqId    = var.vpc_seq_id
      VersionId   = var.version_id
      BuildDate   = var.build_date
      AppRole     = "management-governance"
    }
  )
}