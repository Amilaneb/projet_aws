terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "ASIA3ANZG5XQPKBCPCE6"
  secret_key = "fc0DQoUtLIXJ6GzKG3xeo8oNZmys1FksEMq27egB"
  token = "FwoGZXIvYXdzEKr//////////wEaDK5PCO1hcYL/CRR4WCLPAegU+7oqfiv+MJ9qWM2A4oPjxdCqpyLyKRkpgCWcSSwgFSUpQ5DcY1EKPF6Qlq/eyHN8omEDR4+BUxZgKw/FbOjHzLpiX8T+gq++2OVcaR84J/3Kd9OyxHEsnItABPHPXP7b5RoDehKhErVoPribLvPqUZEx1YaaI1EodE3Ps/o8wxDXNYn1PwNlgmT+IcJwZhWXRq7nxUhYgUeiVNdoAIu7NcGmm72ZMRAnordHjXO7BhE88mGyUsIHNtVeMlwrrnIi2NyySExzVluKwun9CCi3z+KcBjIt0NYwLg5s8rz+COhjsNNKl+GIXS/0+LvkI4okUCavS71ZZF2YOaDZMMgMdpI7"
}