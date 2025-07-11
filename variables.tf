#################
# Configuration #
#################

# Add module-specific variables here

########
# Tags #
########
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "opensearch_primary_domain" {
  description = "The primary OpenSearch domain to create the snapshot"
  type        = string
}

variable "opensearch_domain_names" {
  type        = list(string)
  description = "A list of OpenSearch domain names (including the primary and any target domains) that will be allowed to assume the IAM role to access and restore the snapshot from the S3 repository"
}

variable "opensearch_url" {
  description = "OpenSearch endpoint URL (https://...)"
  type        = string
}

variable "opensearch_assume_role_arn" {
  description = "IAM role ARN OpenSearch should assume"
  type        = string
}

variable "aws_profile" {
  description = "aws profile"
  type        = string
}