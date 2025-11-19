# Terraform module for AWS account discovery for Stacklet

This modules creates an IAM role to allow Stacklet to discovery accounts in the organization.

**Note**: this must be run in the root account for the organization.


To use this module:

```terraform
module "org-read" {
    source = "stacklet/onboarding-org-read/aws"
    version = "0.1.0"
    
    resource_prefix = "<PREFIX>"

    stacklet_external_id       = "<EXTERNAL_ID>"
    stacklet_assetdb_role_arn  = "<ASSETDB_ROLE_ARN>"
    stacklet_platform_role_arn = "<PLATFORM_ROLE_ARN>"
}
```

where values for the `stacklet_` prefixed variables are provided by Stacklet.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.org_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.tags_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachments_exclusive.org_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachments_exclusive) | resource |
| [aws_iam_policy.org_readonly_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.org_read_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tags_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_path"></a> [iam\_path](#input\_iam\_path) | A path for IAM created IAM roles. If set, it must include leading and trailing slashes. | `string` | `"/"` | no |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | An arbitrary prefix prepended to names of created resources. | `string` | n/a | yes |
| <a name="input_stacklet_assetdb_role_arn"></a> [stacklet\_assetdb\_role\_arn](#input\_stacklet\_assetdb\_role\_arn) | ARN for the role used by AssetDB - Provided by Stacklet. | `string` | n/a | yes |
| <a name="input_stacklet_external_id"></a> [stacklet\_external\_id](#input\_stacklet\_external\_id) | ID of the Stacklet deployment to restrict what can assume the roles - Provided by Stacklet. | `string` | n/a | yes |
| <a name="input_stacklet_platform_role_arn"></a> [stacklet\_platform\_role\_arn](#input\_stacklet\_platform\_role\_arn) | ARN for the role used by Platform - Provided by Stacklet. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_org_read_role"></a> [org\_read\_role](#output\_org\_read\_role) | ARN for the account-discovery role assumed by Stacklet Platform. |
<!-- END_TF_DOCS -->
