terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws" #type of provider
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"

}

#Sets the region for the provider
provider "aws" {
    region = "us-east-1"
}

#Creates aws bucket
resource "aws_s3_bucket" "s3_bucket" {
    bucket = "oq4th8qorguoeriugj"
}

resource "aws_s3_bucket_public_access_block" "s3_block" {
    bucket = aws_s3_bucket.s3_bucket.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}