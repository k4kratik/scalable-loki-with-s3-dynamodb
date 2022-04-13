data "aws_caller_identity" "current_account_info" {}

data "aws_availability_zones" "available_az" {
  state = "available"
}
