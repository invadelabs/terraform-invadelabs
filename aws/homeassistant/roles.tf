resource "aws_iam_role" "homeassistant" {
  name        = "HomeAssistant"
  description = "Role for HomeAssistant lambda"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "Home Assistant"
  }
}

data "aws_iam_policy" "homeassistant-lambda-basic" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "homeassistant-lambda-basic" {
  role       = aws_iam_role.homeassistant.name
  policy_arn = data.aws_iam_policy.homeassistant-lambda-basic.arn
}
