resource "aws_iam_user" "john" {
  name = "john.doe"
  path = "/test/"

  tags = {
    Name = "John",
    Surname = "Doe",
  }
}