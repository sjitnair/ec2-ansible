output "Controlserver_putty_login" {
  value = "ubuntu@${aws_instance.tf_ec2_instance.public_ip}"
}

output "Manage_putty_login" {
  value = [
    for ip in aws_instance.tf_ec2_manage[*].public_ip :
    "ubuntu@${ip}"
  ]
}