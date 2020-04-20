#this random we are trying to attach to name of few resources. many times these are part of arn and having upper case , special char is not good idea
resource "random_string" "main" {
  length  = 3
  special = false
  upper   = false
  number  = false
}