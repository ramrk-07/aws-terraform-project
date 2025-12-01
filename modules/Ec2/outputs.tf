output "instance_id" {
  value = aws_instance.web_server.id
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

