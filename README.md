##Demo Terraform configuration for WebVPC with private and public subnets

This configuration is a cut down version of the Complete VPC configuration available from hashicorp

I have left the main vpc resource as a separate resource configurable via modular deployment which can be found in the /resources/vpc directory.

The VPC module in the root folder configures a VPC with the following:

    CIDR: "10.1.0.0/16"
    Availability Zones: "eu-west-1a", "eu-west-1b"
    Private Subnets "10.1.0.0/24", "10.1.10.0/24"
    Public Subnets  "10.1.20.0/24", "10.1.30.0/24"
    Single Nat Gateway for private subnets
    Internet Gateway for public subnets

  All aspects of the configuration are controlled by variables either in the VPC module or by the default values in the variables.tf in the VPC resource folder.

  Run:

    terraform init
    terraform plan
    terraform apply (with valid AWS credentials assigned in AWS CLI will generate AWS resources)
    terraform destoy (will remove all AWS resources)