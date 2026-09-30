terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.2"
    }
  }

  # The floor is a Terraform line that still receives patches, not the oldest
  # release that can run this module. The oldest is 1.3, where startswith and
  # endswith in the iam_path validation landed. Nothing is gained by supporting
  # that far back, and 1.13 and earlier no longer get security fixes.
  required_version = ">= 1.14.0"
}
