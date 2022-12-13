data "aws_iam_role" "cloudwatch" {
  name = "robomaker_students"
}


resource "aws_lambda_function" "isen_function" {
  function_name = "isen-function"
  filename = "${path.module}/lambda_functions.zip"
  role = data.aws_iam_role.cloudwatch.arn
  source_code_hash = filebase64sha256("${path.module}/lambda_functions.zip")
  runtime = "python3.9"
  handler = "lambda_function_injection.lambda_handler"

  environment {
    variables = {
      PUBLIC_IP = var.public-ip
    }
  }
}



