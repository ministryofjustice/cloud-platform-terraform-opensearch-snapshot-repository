# cloud-platform-terraform-template

[![Releases](https://img.shields.io/github/v/release/ministryofjustice/cloud-platform-terraform-template.svg)](https://github.com/ministryofjustice/cloud-platform-terraform-template/releases)

This Terraform module will create an S3 snapshot repository, IAM role, and IAM policy for use with Amazon OpenSearch on the Cloud Platform.

## Usage

```hcl
module "opensearch_snapshot_repository" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-opensearch-snapshot?ref=latest" # Replace `latest` with the latest version tag

  providers = {
    opensearch = <your-opensearch-domain-provider>
  }

  opensearch_domain_name       = "your-opensearch-domain-name"
  opensearch_domain_names      = ["your-opensearch-domain-names"] # List of 
}
```

See the [examples/](examples/) folder for more information.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |
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
| [opensearch_snapshot_repository.this](https://registry.terraform.io/providers/opensearch-project/opensearch/2.3.1/docs/resources/snapshot_repository) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_snapshot_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | aws profile | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the IAM role to be assumed by OpenSearch | `string` | n/a | yes |
| <a name="input_opensearch_assume_role_arn"></a> [opensearch\_assume\_role\_arn](#input\_opensearch\_assume\_role\_arn) | IAM role ARN OpenSearch should assume | `string` | n/a | yes |
| <a name="input_opensearch_domain_name"></a> [opensearch\_domain\_name](#input\_opensearch\_domain\_name) | Name of the main OpenSearch | `string` | n/a | yes |
| <a name="input_opensearch_domain_names"></a> [opensearch\_domain\_names](#input\_opensearch\_domain\_names) | List of OpenSearch domain names allowed to assume this role | `list(string)` | n/a | yes |
| <a name="input_opensearch_url"></a> [opensearch\_url](#input\_opensearch\_url) | OpenSearch endpoint URL (https://...) | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Tags

Some of the inputs for this module are tags. All infrastructure resources must be tagged to meet the MOJ Technical Guidance on [Documenting owners of infrastructure](https://technical-guidance.service.justice.gov.uk/documentation/standards/documenting-infrastructure-owners.html).

You should use your namespace variables to populate these. See the [Usage](#usage) section for more information.

## Reading Material

<!-- Add links to useful documentation -->

- [Cloud Platform user guide](https://user-guide.cloud-platform.service.justice.gov.uk/#cloud-platform-user-guide)
