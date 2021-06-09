terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/custom-service-endpoints#dynamodb-local
provider "aws" {
  region                      = "us-west-2"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    dynamodb = "http://dynamodb:8000"
  }
}

resource "aws_dynamodb_table" "strategies_table" {
  name           = "strategies"
  billing_mode   = "PROVISIONED" # We'd probably use ON_DEMAND if it were free-tier eligible
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "investment_strategy_id"
  attribute {
    name = "investment_strategy_id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "users_table" {
  name           = "users"
  billing_mode   = "PROVISIONED" # We'd probably use ON_DEMAND if it were free-tier eligible
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "user_id"
  attribute {
    name = "user_id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "tokens_table" {
  name           = "tokens"
  billing_mode   = "PROVISIONED" # We'd probably use ON_DEMAND if it were free-tier eligible
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "token"
  ttl {
    enabled        = true
    attribute_name = "expiration_timestamp"
  }
  attribute {
    name = "token"
    type = "S"
  }
}

resource "aws_dynamodb_table" "holdings_table" {
  name           = "holdings"
  billing_mode   = "PROVISIONED" # We'd probably use ON_DEMAND if it were free-tier eligible
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "user_id"
  range_key      = "stock_ticker"
  attribute {
    name = "user_id"
    type = "S"
  }
  attribute {
    name = "stock_ticker"
    type = "S"
  }
}

resource "aws_dynamodb_table" "stock_prices_table" {
  name           = "stock_prices"
  billing_mode   = "PROVISIONED" # We'd probably use ON_DEMAND if it were free-tier eligible
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "stock_ticker"
  range_key      = "timestamp"
  attribute {
    name = "stock_ticker"
    type = "S"
  }
  attribute {
    name = "timestamp"
    type = "S"
  }
}

resource "aws_dynamodb_table" "stock_statistics_table" {
  name           = "stock_statistics"
  billing_mode   = "PROVISIONED" # We'd probably use ON_DEMAND if it were free-tier eligible
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "stock_ticker"
  attribute {
    name = "stock_ticker"
    type = "S"
  }
}
