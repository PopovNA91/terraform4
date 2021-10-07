output "ubuntu_region" {
  value = aws_instance.Ubuntu.availability_zone
}

output "ubuntu_private_ip" {
  value = aws_instance.Ubuntu.private_ip
}

output "ubuntu_subnet_id" {
  value = aws_instance.Ubuntu.subnet_id
} 

output "AWS_account_ID" {
  value = data.aws_caller_identity.current.account_id
} 

output "AWS_user_ID" {
  value = data.aws_caller_identity.current.user_id
} 

output "AWS_region" {
  value = data.aws_region.current.name
} 
