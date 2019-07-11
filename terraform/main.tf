resource "aws_s3_bucket" "docs_bucket" {
  bucket = "${var.s3__name}"
  acl    = "private"

  tags {
    Name = "${var.s3__name}"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["HEAD", "GET", "DELETE", "PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["x-amz-server-side-encryption", "x-amz-request-id", "x-amz-id-2", "ETag"]
    max_age_seconds = 3000
  }
}


resource "aws_iam_group" "docs_user_group" {
  name = "${var.iam__group_name}"
  path = "/users/"
}


resource "aws_iam_group_policy" "docs_user_policy" {
  name  = "${var.iam__group_policy_name}"
  group = "${aws_iam_group.docs_user_group.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectAcl"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.docs_bucket.arn}/*"
    }
  ]
}
EOF
}
