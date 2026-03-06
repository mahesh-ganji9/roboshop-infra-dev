resource "aws_instance" "bastioninstance" {
    ami = local.ami_id
    instance_type = "t3.micro"
    subnet_id = local.public_subnet_id
    vpc_security_group_ids = [ local.bastionsg_id ]
    iam_instance_profile = aws_iam_instance_profile.bastion.name
    tags = local.ec2_final_tags
    user_data = file("bastion.sh")
    root_block_device {
          volume_size = 50
          volume_type = "gp3"
          tags = merge(local.common_tags,
          {
            Name = "${var.project}-${var.env}-ebs-volume0"
          })
    }
} 

resource "aws_iam_role" "bastioniamrole" {
  name = "${var.project}-${var.env}-bastionec2role"

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
}

resource "aws_iam_role_policy_attachment" "bastionpolicyattach" {
    role = aws_iam_role.bastioniamrole.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "bastion" {
   role = aws_iam_role.bastioniamrole.name
   name = "bastioninstanceprofile"
}