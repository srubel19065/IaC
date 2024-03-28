# create an ec2 instance 

# where to create it - provide cloud name
provider "aws"{
# which region to use to create a resource/service
    region = "eu-west-1"
}
# which service
resource "aws_instance" "tech257_rubel_terraform_app" {

# which AMI ID
    #ami = "ami-02f0341ac93c96375"
    ami = var.app_ami_id

# what type of instance 
    #instance_type = "t2.micro"
    instance_type = var.app_instance_type

# please add a public ip to this instance
    #associate_public_ip_address = true
    associate_public_ip_address = var.app_public_ip

# aws_access_key = ... <<< MUST NOT DO THIS
# aws_secret_key = ... <<< MUST NOT DO THIS

# Adding a key pair to use to ssh in
    #key_name = "tech257"
    key_name = var.app_key

# The security group created needs to be put into the instance
    security_groups = [aws_security_group.tech257_rubel_terraform_app_sg.name]

# name the service
    tags = {
        #Name = "tech257_rubel_terraform_app"
        Name = var.app_tag_name
    }
}
# creating security group with 3 ports
resource "aws_security_group" "tech257_rubel_terraform_app_sg" {

    name = var.app_sg
    description = "Security group allowing port 22 from local host, port 3000 and port 80 to be accessed"
    
        ingress {                     # ingress means inbound rules
            from_port = 22        # from port 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

       ingress {
            from_port = 3000
            to_port = 3000
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.42.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }    # Providing version of github
}
provider "github" {
  token = var.github_token
} # where you want to create the repo with the token linked to the creation location account

resource "github_repository" "multi-provider-terraform" {
  name = "multi-provider-terraform"
  description = "Repo for multi provider terraform"

   visibility = "public"
} # creates the repo with name, description and whether it will be public or not