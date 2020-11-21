variable "env" {
  description = "Deployment environment"
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  default     = "eu-central-1"
}

variable "repository_owner" {
  description = "GitHub repository owner"
  default     = "LuckyDucky583"
}

variable "env_name" {
  default = "s3-to-s3-reverse-data"
  description = "Terraform environment name"
}