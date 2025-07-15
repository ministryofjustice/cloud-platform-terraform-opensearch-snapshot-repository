# cloud-platform-terraform-opensearch-snapshot-repository

[![Releases](https://img.shields.io/github/v/release/ministryofjustice/cloud-platform-terraform-opensearch-snapshot-repository.svg)](https://github.com/ministryofjustice/cloud-platform-terraform-opensearch-snapshot-repository/releases)

This Terraform module will create:
- An S3 bucket to store OpenSearch snapshots
- An IAM role with a trust relationship for OpenSearch
- An IAM policy granting required S3 permissions

These resources are configured to support snapshot creation and restoration across one or more Amazon OpenSearch domains on the Cloud Platform.

Key Inputs
- `opensearch_primary_domain`: The name of the OpenSearch domain that will create the snapshot.
- `opensearch_domain_names`: A list of OpenSearch domain names (including the primary and any target domains) that will be allowed to assume the IAM role to access and restore the snapshot from the S3 repository.

## Usage
```hcl
module "opensearch_snapshot_repository" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-opensearch-snapshot?ref=latest" # Replace `latest` with the latest version tag

  providers = {
    opensearch = <your-opensearch-domain-provider>
  }

  opensearch_primary_domain       = "your-opensearch-domain-name"
  opensearch_domain_names      = ["your-opensearch-domain-names"] # List of domain names allowed to assume the role
}
```

See the [examples/](examples/) folder for more information.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |
| <a name="requirement_opensearch"></a> [opensearch](#requirement\_opensearch) | 2.3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |
| <a name="provider_opensearch"></a> [opensearch](#provider\_opensearch) | 2.3.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | 4.3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.s3_snapshot_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.opensearch_snapshot_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [opensearch_roles_mapping.manage_snapshots_mapping](https://registry.terraform.io/providers/opensearch-project/opensearch/2.3.1/docs/resources/roles_mapping) | resource |
| [opensearch_snapshot_repository.this](https://registry.terraform.io/providers/opensearch-project/opensearch/2.3.1/docs/resources/snapshot_repository) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_snapshot_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_opensearch_domain_names"></a> [opensearch\_domain\_names](#input\_opensearch\_domain\_names) | A list of OpenSearch domain names (including the primary and any target domains) that will be allowed to assume the IAM role to access and restore the snapshot from the S3 repository | `list(string)` | n/a | yes |
| <a name="input_opensearch_primary_domain"></a> [opensearch\_primary\_domain](#input\_opensearch\_primary\_domain) | The primary OpenSearch domain to create the snapshot | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Tags

Some of the inputs for this module are tags. All infrastructure resources must be tagged to meet the MOJ Technical Guidance on [Documenting owners of infrastructure](https://technical-guidance.service.justice.gov.uk/documentation/standards/documenting-infrastructure-owners.html).

You should use your namespace variables to populate these. See the [Usage](#usage) section for more information.

## Reading Material

<!-- Add links to useful documentation -->

- [Cloud Platform user guide](https://user-guide.cloud-platform.service.justice.gov.uk/#cloud-platform-user-guide)
