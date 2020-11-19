variable "env" {
  description = "Deployment environment"
  default = "dev"
}

variable "region" {
  description = "AWS region"
  default = "eu-central-1"
}

variable "repository_owner" {
  description = "GitHub repository owner"
  default = "LuckyDucky583"
}

variable "dataBucket"{
  description = "S3 Bucket with the original String data"
  default = "data-bucket"
}

variable "reverseBucket" {
  description = "S3 Bucket with the reversed data"
  default = "reverse-bucket"
}

variable "test" {
  description = "test"
  default = ""
}