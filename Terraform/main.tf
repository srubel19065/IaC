# create an ec2 instance 

# where to create it - provide cloud name
provider "aws"{
# which region to use to create a resource/service
    region = "eu-west-1"
}
# which service
resource "aws_instance" "tech257_rubel_terraform_app" {

# which AMI ID
    ami = "ami-02f0341ac93c96375"
# what type of instance 
    instance_type = "t2.micro"
# please add a public ip to this instance
    associate_public_ip_address = true
# aws_access_key = ... <<< MUST NOT DO THIS
# aws_secret_key = ... <<< MUST NOT DO THIS

# Adding a key pair to use to ssh in
    key_name = "tech257"
# The security group created needs to be put into the instance
    security_groups = [aws_security_group.tech257_rubel_terraform_app_sg.name]
# name the service
    tags = {
        Name = "tech257_rubel_terraform_app"
    }
}
# creating security group with 3 ports
resource "aws_security_group" "tech257_rubel_terraform_app_sg" {

    name = "tech257_rubel_terraform_app_sg"
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
