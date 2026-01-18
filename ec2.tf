resource "aws_instance" "tf_ec2_instance" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = true
  key_name                    = var.ec2_key_name

  vpc_security_group_ids = [aws_security_group.tf_ec2_sg.id]
#  depends_on             = [aws_s3_object.tf_s3_object]

  user_data = file("./bootstrap.sh")

  tags = merge (
    local.common_tags,
    {
      Name = "Ansible_server"
      Usage = "To run Ansible control server"
      User_script = "bootstrap-ec2"
    }
  )
}

resource "aws_instance" "tf_ec2_manage" {
  count                       = var.manage_count
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = false
  key_name                    = var.ec2_key_name

  vpc_security_group_ids = [aws_security_group.tf_ec2_sg.id]

  tags = merge (
    local.common_tags,
    {
      Name = "server-${count.index + 1}"
      Usage = "To run client/manage server"
    }
  )
}

resource "aws_security_group" "tf_ec2_sg" {
  name        = "Ansible-server-sg"
  description = "Allow SSH traffic"
  vpc_id      = var.vpc_id

#  ingress {
#    from_port   = 8080
#    to_port     = 8080
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

  tags = merge (
    local.common_tags,
    {
      Name = "SG${var.req_id}"
      Usage = "Ansible Ec2 server security group"
    }
  )

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

