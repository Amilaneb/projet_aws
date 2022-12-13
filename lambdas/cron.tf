resource "aws_cloudwatch_event_rule" "demo-lambda" {
  name = "demo-lambda-isen"
  description = "fires every minutes"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "lambda-trigger" {
  rule = aws_cloudwatch_event_rule.demo-lambda.name
  target_id = "lambda"
  arn = aws_lambda_function.isen_function.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_tocall_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.isen_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.demo-lambda.arn
}