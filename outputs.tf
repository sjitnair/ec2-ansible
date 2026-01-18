output "ec2_putty_login" {
  value = "ubuntu@${aws_instance.tf_ec2_instance.public_ip}"
}

