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

variable "opensearch_domain_name" {
  description = "Name of the main OpenSearch"
  type        = string
}

variable "opensearch_domain_names" {
  type        = list(string)
  description = "List of OpenSearch domain names allowed to assume this role"
}


variable "iam_role_name" {
  description = "Name of the IAM role to be assumed by OpenSearch"
  type        = string
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