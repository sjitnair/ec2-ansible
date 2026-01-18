locals {

  # -----------------
  # Common Tags
  # -----------------
  common_tags = {
    Request_id  = var.req_id
    Environment = var.environment
    Project     = var.proj_name
    ManagedBy   = "Sreejith"
  }
}
