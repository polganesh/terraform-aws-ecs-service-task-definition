variable "task_service_for" {
  default = "default"
}

variable "ecs_cluster_id" {
  default     = ""
  description = "ARN of an ECS cluster"
}

variable "desire_count" {
  default = "The number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy."
}

variable "ecs_role_arn" {
  default     = ""
  description = "ARN of the IAM role that allows Amazon ECS to make calls to your load balancer on your behalf. This parameter is required if you are using a load balancer with your service, but only if your task definition does not use the awsvpc network mode. If using awsvpc network mode, do not specify this role. If your account has already created the Amazon ECS service-linked role, that role is used by default for your service unless you specify a role here"
}

variable "network_mode" {
  default     = "bridge"
  description = "The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host."
}

variable "task_cpu" {
  description = "The number of cpu units used by the task. If the requires_compatibilities is FARGATE this field is required."
  default     = 1024
}

variable "task_memory" {
  default     = 2048
  description = "The amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required."
}

variable "location_of_container_defn" {
  default     = ""
  description = "location of json file containing container defination "
}

variable "task_definition_execution_role_arn" {
  default     = ""
  description = " The Amazon Resource Name (ARN) of the task execution role that the Amazon ECS container agent and the Docker daemon can assume."
}

variable "requires_compatibilities" {
  default     = ["EC2"]
  description = "A set of launch types required by the task. The valid values are EC2 and FARGATE."
}

# variable "is_require_cw_lgrp" {
#   default     = "true"
#   description = "if true it will create cloud watch log group"
# }

variable "cw_lgrp_retention_in_days" {
  default     = 7
  description = " Specifies the number of days you want to retain log events in the specified log group."
}

variable "common_tags" {
  type    = map
  default = {}
}

variable "tags_for_task_defination" {
  type    = map
  default = {}
}

variable "tags_for_cw_lgrp" {
  type    = map
  default = {}
}

variable "environment" {
  description = "indicates name of our environment. possible values dev,cit,sit,uat,pprod,prod,n"
  default     = "dev"
}

variable "cost_centre" {
  description = "A part of an organization to which costs may be charged.e.g. finance/it/hr/wholesale/retail/investment etc..."
  default     = ""
}

variable "region_id" {
  default = "euw1"
}

# useful if need to add tag
variable "region" {
  description = "region in which resource is created."
  default     = "eu-west-1"
}

# useful if need to add tag
variable "version_id" {
  description = "version of this component.everytime when we are updating this component we need to increment it."
  default     = ""
}

variable "build_date" {
  description = "date on which this component built/modified. format ddmmyyyy e.g. 27122017"
  default     = ""
}

variable "vpc_seq_id" {}
variable "seq_id" {}
variable "app_service" {}

variable "service_task_def_depends_on" {
  default     = []
  description = "list of aws resources to wait for creating this "
}

variable "volumes" {
  description = "volumes for task defination"
  type        = list(map(any))
  default     = []
}

variable "load_balancers" {
  type    = list(map(any))
  default = []
}

variable "container-defn-placeholder-map" {
  type    = map
  default = {}
}

variable "cw_lgrp_for_list" {
  type    = list
  default = []
}



















