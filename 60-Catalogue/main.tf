resource "aws_instance" "catalogue" {
  ami                    = local.ami_id
  instance_type          = var.instance_type
  subnet_id              = local.private_subnet_ids
  vpc_security_group_ids = [local.catalogue_sg_id ]
  tags = merge(local.common_tags, {
    Name = "${var.project}-${var.env}-catalogue"}
  )
}

resource "terraform_data" "bootstrap" {
   triggers_replace = [
     aws_instance.catalogue.id
   ]
   connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.catalogue.private_ip
   }

   provisioner "file" {
     source = "bootstrap.sh"
     destination = "/tmp/bootstrap.sh"
   }
#    provisioner "remote-exec" {
#       inline = [ 
#         "chmod +x /tmp/bootstrap.sh",
#         "sudo sh /tmp/bootstrap.sh"
#        ]
#    }
   provisioner "remote-exec" {
      inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh catalogue ${var.env}"
       ]
   }
}

resource "aws_ec2_instance_state" "catalogue_state" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
}

resource "aws_ami_from_instance" "catalogue_ami" {
  name               = "${var.project}-${var.env}-catalogue-ami"
  source_instance_id = aws_instance.catalogue.id

  depends_on = [ aws_ec2_instance_state.catalogue_state ]
}