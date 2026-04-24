variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)"

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "The environment must be either \"dev\" or \"prod\"."
  }
}

variable "project_name" {
  type        = string
  description = "The name of the project, used as a prefix in resource names"
}

variable "region" {
  type        = string
  description = "The AWS region where resources will be deployed"
  default     = "us-east-1"
}

variable "bucket_suffix" {
  type        = string
  description = "The suffix for the S3 bucket name (e.g. uploads, assets)"
}
