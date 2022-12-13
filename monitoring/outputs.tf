output "dashboard" {
  value = aws_cloudwatch_dashboard.isen_dashboard.id
}

output "alarm" {
  value = aws_cloudwatch_metric_alarm.isen_alarm.id
}