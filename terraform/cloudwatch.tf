resource "aws_cloudwatch_event_rule" "once_daily" {
  name        = "once_daily"
  description = "run once daily"

  schedule_expression = "cron(0 20 * * ? *)"
}

resource "aws_cloudwatch_event_target" "twitterbot_lambda" {
  rule      = "${aws_cloudwatch_event_rule.once_daily.name}"
  target_id = "twitter_wawa"
  arn       = "${aws_lambda_function.twitterbot.arn}"
}
