
# ==========================================
# DevConnect Pro - Terraform Variables
# ==========================================

variable "aws_region" {
  description = "AWS region for project resources."
  type        = string
}

variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "root_volume_size_gb" {
  description = "Root EBS volume size in GB."
  type        = number
}

variable "root_volume_type" {
  description = "Root EBS volume type."
  type        = string
  default     = "gp3"
}

variable "allowed_ssh_cidrs" {
  description = "CIDR ranges allowed to SSH into EC2."
  type        = list(string)
}

variable "allowed_http_cidr" {
  description = "CIDR allowed to access HTTP/HTTPS app ingress. Use 0.0.0.0/0 for public demo access."
  type        = string
  default     = "0.0.0.0/0"
}

variable "allowed_admin_cidr" {
  description = "CIDR allowed to access admin ports."
  type        = string
  default     = "127.0.0.1/32"
}

variable "existing_key_name" {
  description = "Existing AWS EC2 key pair name. Leave empty to create a new key pair."
  type        = string
  default     = ""
}

variable "public_key_path" {
  description = "Path to the SSH public key."
  type        = string
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP with EC2."
  type        = bool
  default     = true
}

variable "enable_k3s_api_access" {
  description = "Whether to enable Kubernetes API access."
  type        = bool
  default     = false
}

variable "enable_monitoring_admin_ports" {
  description = "Whether to enable monitoring admin ports."
  type        = bool
  default     = false
}

variable "enable_ssm" {
  description = "Whether to enable AWS Systems Manager."
  type        = bool
  default     = true
}

variable "extra_tags" {
  description = "Additional tags for resources."
  type        = map(string)
  default     = {}
}

