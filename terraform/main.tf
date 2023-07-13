provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "tags" {
  source       = "./modules/tags"
  moniker      = var.moniker
  environment  = var.environment
  company_name = var.company_name
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket        = var.bucket_names
  force_destroy = var.force_destroy
  tags          = merge(module.tags.common_tags, module.tags.s3_specific_tags)
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket                  = aws_s3_bucket.s3-bucket.id
  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3-bucket-policy" {
  bucket = aws_s3_bucket.s3-bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.s3-bucket.id}/*"
      }
    ]
  })
}

resource "aws_s3_object" "object" {
  bucket       = aws_s3_bucket.s3-bucket.bucket
  key          = "autism_prediction.html"
  source       = "../src/autism_prediction.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "s3-bucket-website" {
  bucket = aws_s3_bucket.s3-bucket.id

  index_document {
    suffix = "autism_prediction.html"
  }
}

resource "null_resource" "reupload" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "aws s3 cp ../src/autism_prediction.html s3://${aws_s3_bucket.s3-bucket.bucket}"
  }
}
