# Required
variable "region" {
  description = "The AWS region to use"
  type        = string
}

variable "name" {
  description = "The name of the resource"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnets" {
  description = "Subnet IDs"
  type        = list(string)
}

# Optional
variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}


variable "creation_token" {
  description = "A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation. By default generated by Terraform"
  type        = string
  default     = null
}

variable "performance_mode" {
  description = "The file system performance mode. Can be either `generalPurpose` or `maxIO`. Default is `generalPurpose`"
  type        = string
  default     = null
}

variable "encrypted" {
  description = "If `true`, the disk will be encrypted"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "The ARN for the KMS encryption key. When specifying `kms_key_arn`, encrypted needs to be set to `true`"
  type        = string
  default     = null
}


variable "provisioned_throughput_in_mibps" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with `throughput_mode` set to `provisioned`"
  type        = number
  default     = null
}

variable "throughput_mode" {
  description = "Throughput mode for the file system. Defaults to `bursting`. Valid values: `bursting`, `provisioned`. When using `provisioned`, also set `provisioned_throughput_in_mibps`"
  type        = string
  default     = null
}

variable "lifecycle_policy" {
  description = "A file system [lifecycle policy](https://docs.aws.amazon.com/efs/latest/ug/API_LifecyclePolicy.html) object"
  type        = any
  default     = {}
}

variable "attach_policy" {
  description = "Determines whether a policy is attached to the file system"
  type        = bool
  default     = true
}

variable "policy_statements" {
  description = "A list of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = any
  default     = []
}

variable "mount_targets" {
  description = "A map of mount target definitions to create"
  type        = any
  default     = {}
}

variable "security_group_description" {
  description = "Security group description. Defaults to Managed by Terraform"
  type        = string
  default     = null
}

variable "security_group_vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
  default     = null
}

variable "security_group_rules" {
  description = "Map of security group rule definitions to create"
  type        = any
  default     = {}
}

variable "access_points" {
  description = "A map of access point definitions to create"
  type        = any
  default     = {}
}

variable "enable_backup_policy" {
  description = "Enable backup policy"
  type        = bool
  default     = false
}

variable "create_replication_configuration" {
  description = "Enable replication configuration creation"
  type        = bool
  default     = false
}

variable "replication_configuration_destination" {
  description = "A map of replication configuration destination definitions to create"
  type        = any
  default     = {}
}