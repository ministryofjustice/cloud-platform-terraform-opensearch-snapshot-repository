#################
# Configuration #
#################

variable "opensearch_primary_domain" {
  description = "The primary OpenSearch domain to create the snapshot"
  type        = string
}

variable "opensearch_domain_names" {
  type        = list(string)
  description = "A list of OpenSearch domain names (including the primary and any target domains) that will be allowed to assume the IAM role to access and restore the snapshot from the S3 repository"
}

variable "additional_snapshot_backend_roles" {
  description = "Extra backend roles to map to the manage_snapshots role"
  type        = list(string)
  default     = []
}