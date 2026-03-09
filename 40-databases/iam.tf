resource "aws_iam_role" "mysql" {
  name = "${var.project}-${var.env}-mysql-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}


resource "aws_iam_policy" "sql_policy" {
  name = "${var.project}-${var.env}-mysql-policy"
  policy = templatefile("mysql-iam-policy.json", {
      env = var.env
  })
}

resource "aws_iam_role_policy_attachment" "mysql_policy_attach" {
    role = aws_iam_role.mysql.name
    policy_arn = aws_iam_policy.sql_policy.arn
}


resource "aws_iam_instance_profile" "mysql_instance_profile" {
   name = "${var.project}-${var.env}-mysql-profile"
   role = aws_iam_role.mysql
}