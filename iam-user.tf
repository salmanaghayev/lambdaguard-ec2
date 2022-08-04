resource "aws_iam_user" "LG_Usr" {
  name = "LambdaGuardUser"
}

resource "aws_iam_access_key" "LG_Usr_Key01" {
  user = aws_iam_user.LG_Usr01.name
}

resource "aws_iam_user" "LG_Usr01" {
  name = "LambdaGuardUser01"
}

resource "aws_iam_policy_attachment" "attach_ReadOnlyAccess" {
  name       = "attach_ReadOnlyAccess"
  users      = [aws_iam_user.LG_Usr01.name]
  policy_arn = data.aws_iam_policy.ReadOnlyAccess.arn
}

data "aws_iam_policy" "ReadOnlyAccess" {
  name = "ReadOnlyAccess"
}

output "secret_key" {
  value = aws_iam_access_key.LG_Usr_Key01.secret
  sensitive = true
}

output "access_key" {
  value = aws_iam_access_key.LG_Usr_Key01.id
}