data "archive_file" "homeassistant" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "homeAssistant.zip"
}

resource "aws_lambda_function" "homeassistant" {
  filename      = "homeAssistant.zip"
  function_name = "homeAssistant"
  role          = aws_iam_role.homeassistant.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = filebase64sha256("homeAssistant.zip")

  runtime = "python3.7"

  environment {
    variables = {
      BASE_URL       = var.base_url
      DEBUG          = "True"
      NOT_VERIFY_SSL = "True"
    }
  }
}
