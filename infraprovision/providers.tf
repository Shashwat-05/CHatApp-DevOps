terraform {
    required_providers  {
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.0"
      }
    }
}

provider "aws" {
    region = "us-east-2"
    shared_credentials_file = "/home/sp05/.aws/credentials"
    shared_config_file = "/home/sp05/.aws/config"
    profile = "default"
}
