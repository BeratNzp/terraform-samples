resource "aws_iam_user" "john" {
  name = "john.doe"
  path = "/test/"

  tags = {
    tag-key = "Name-John",
    tag-key = "Surname-Doe",
  }
}