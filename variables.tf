variable "PROJECT_ID" {
  type = string
}

variable "GOOGLE_API_KEY" {
  type = string
}

variable "LANGFUSE_HOST" {
  type = string
}

variable "LANGFUSE_PUBLIC_KEY" {
  type = string
}

variable "LANGFUSE_SECRET_KEY" {
  type = string
}

variable "DATA_STORE_ID" {
  type = string
}

locals {
  location = "asia-northeast1"
}
