resource "aws_lambda_function" "twitterbot" {
  filename      = "twitterbot.zip"
  function_name = "twitterbot"
  role          = "${aws_iam_role.twitterbot.arn}"
  handler       = "twitterbot.main"

  source_code_hash = "${filebase64sha256("twitterbot.zip")}"

  runtime = "python3.7"

  environment {
    variables = {
      AUTHTOKEN = "${var.twitterauthtoken}"
    }
  }
}
