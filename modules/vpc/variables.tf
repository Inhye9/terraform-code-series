variable "project_name" {
  type        = string
  description = "Project Name"
  default     = "tf-code-series"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
  default     = "10.190.0.0/16"
}

variable "public_subnets" {
  type        = map(string)
  description = "public subnet"
  default = {
    "ap-northeast-2a" : "10.190.0.0/24"
    "ap-northeast-2c" : "10.190.1.0/24"
  }
}

variable "private_subnets" {
  type        = map(string)
  description = "prviate subnet"
  default = {
    "ap-northeast-2a" : "10.190.100.0/24"
    "ap-northeast-2c" : "10.190.101.0/24"
  }
}
