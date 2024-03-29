variable "region" {
  description = "The AWS region to use"
  type        = string
  default     = "us-east-1"
}

variable "app" {
  description = "The name of the app"
  type        = string
}

variable "env" {
  description = "The environment to set"
  type        = string
}

variable "repo_name" {
  description = "The name of the repository"
  type        = string
}

variable "repo_branch" {
  description = "The branch of the repository"
  type        = string
}

variable "s3_bucket_artifact" {
  description = "The S3 bucket to store the artifact"
  type        = string
}

variable "s3_bucket_artifact_arn" {
  description = "The ARN S3 bucket to store the artifact"
  type        = string
}

variable "s3_bucket_frontend" {
  description = "The S3 bucket used for the frontend"
  type        = string
}

variable "s3_bucket_frontend_arn" {
  description = "The ARN S3 bucket used for the frontend"
  type        = string
}

variable "environment_build_variables" {
  description = "The environment variables to use"
  type        = list(map(string))
  default     = []
}

variable "create_invalidation_stage" {
  description = "Create an invalidation stage"
  type        = bool
  default     = false
}

variable "invalidation_function_name" {
  description = "The name of the invalidation function"
  type        = string
  default     = null
}

variable "cloudfront_id" {
  description = "The ID of the CloudFront distribution. Required if creating an invalidation stage"
  type        = string
  default     = null
}

variable "build_image" {
  description = "The name of the build image to use"
  type        = string
  default     = "aws/codebuild/standard:5.0"
}

variable "build_compute_type" {
  description = "The compute type to use"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}
