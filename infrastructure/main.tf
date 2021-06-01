# ~/.aws/credentials, see https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
# [terraform]
# aws_access_key_id=I0W9FEJ2UF9SDFISFDB
# aws_secret_access_key=w9fu2efuwfh0qw98fwe8ufhudf/sd

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terraform"
}
