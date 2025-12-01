##############################################
# EC2 CPU Utilization Alarm
##############################################

resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
  alarm_name          = "EC2-High-CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "EC2 CPU Utilization is above 70%"
  alarm_actions       = []
  ok_actions          = []

  dimensions = {
    InstanceId = var.ec2_instance_id
  }
}

##############################################
# RDS High CPU Alarm
##############################################

resource "aws_cloudwatch_metric_alarm" "rds_cpu" {
  alarm_name          = "RDS-High-CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "RDS CPU Utilization above 70%"

  dimensions = {
    DBInstanceIdentifier = var.db_instance_id
  }
}

##############################################
# RDS Free Storage Low
##############################################

resource "aws_cloudwatch_metric_alarm" "rds_storage" {
  alarm_name          = "RDS-Low-Storage"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Minimum"
  threshold           = 10000000000   # 10GB
  alarm_description   = "RDS Free Storage below 10GB"

  dimensions = {
    DBInstanceIdentifier = var.db_instance_id
  }
}
