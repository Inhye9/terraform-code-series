variable "project_name" {
  type        = string 
  default     = "tf-code-series" 
  description = "Project Name"
}

variable "ecr_repo_name" {
  type        = string
  default     = "tf-ecr-repo"
  description = "ECR Registry Name"
}

