# -----------------
# General
# -----------------
variable "req_id" {
  description = "Request id for this deployment"
  type        = string
}

variable "proj_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "Dev"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-02a3046e80968cf34"
}


# -----------------
# EC2
# -----------------
variable "ec2_ami" {
  description = "AMI ID for EC2"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro" # m7i-flex.large
}

variable "ec2_key_name" {
  description = "EC2 key pair name"
  type        = string
}

