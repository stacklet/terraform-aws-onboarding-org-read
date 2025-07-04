resource "aws_iam_role" "org_read" {
  name               = "${var.resource_prefix}-org-read"
  description        = "Access to read accounts information for ${var.resource_prefix} Stacklet deployment"
  path               = var.iam_path
  assume_role_policy = data.aws_iam_policy_document.org_read_assume.json
}

data "aws_iam_policy_document" "org_read_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "AWS"
      identifiers = [
        var.stacklet_assetdb_role_arn,
        var.stacklet_platform_role_arn,
      ]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.stacklet_external_id]
    }
  }
}

data "aws_iam_policy" "org_readonly_access" {
  name = "AWSOrganizationsReadOnlyAccess"
}

resource "aws_iam_role_policy_attachments_exclusive" "org_read" {
  role_name   = aws_iam_role.org_read.name
  policy_arns = [data.aws_iam_policy.org_readonly_access.arn]
}

resource "aws_iam_role_policy" "tags_read" {
  name   = "AllowBulkTagRead"
  role   = aws_iam_role.org_read.id
  policy = data.aws_iam_policy_document.tags_read.json
}

data "aws_iam_policy_document" "tags_read" {
  statement {
    actions   = ["tag:GetResources"]
    resources = ["*"]

  }
}
