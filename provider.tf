terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.2"
    }
  }

  # startswith/endswith in the iam_path validation landed in Terraform 1.3, but
  # the floor sits at 1.5.7: 1.0.8 through 1.5.6 allow an arbitrary file write
  # during init on crafted configuration (CVE-2023-4782), and the fix was never
  # backported below 1.5.7.
  required_version = ">= 1.5.7"
}
