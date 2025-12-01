output "ec2_cpu_alarm_id" {
  value = aws_cloudwatch_metric_alarm.ec2_cpu.id
}

output "rds_cpu_alarm_id" {
  value = aws_cloudwatch_metric_alarm.rds_cpu.id
}

output "rds_storage_alarm_id" {
  value = aws_cloudwatch_metric_alarm.rds_storage.id
}
