variable "bca-aws-master-region" {
  type    = string
  default = "ap-southeast-1"
}

#/*EC2 variables can be used to store values such as the AMI ID, instance type, and VPC ID of an 
#EC2 instance. These values in our Terraform code are used to create and configure EC2 instances. */
variable "ami" {
  description = "ami of ec2 instance"
  type        = string
  default     = "ami-0df7a207adb9748c7"
}

# Launch Template and ASG Variables
variable "instance_type" {
  description = "launch template EC2 instance type"
  type        = string
  default     = "t2.micro"
}


#This user data variable indicates that the script configures Apache on a server.
variable "ec2_user_data" {
  description = "variable indicates that the script configures Apache on a server v1"
  type        = string
  default     = <<EOF
#!/bin/bash
# Install Apache on Ubuntu
sudo apt update -y
sudo apt install -y apache2
sudo cat > /var/www/html/index.html << EOF
<html>
<head>
  <title> Apache 2023 Terraform </title>
</head>
<body>
  <p> Welcome to HelloCloud Meow App Apache WebPage Version-2 "MEOW" powered by AWS EC2 Auto-Scaling Group using Terraform!
</body>
</html>
EOF
}

/*This VPC can then be used to deploy resources that need to be accessible from the internet or from other resources in the VPC.
This variable defines the CIDR block for the VPC. The default value is 10.0.0.0/16.
*/

# VPC Variables
variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = "10.10.0.0/16"
}

#These Public subnets are used for resources that need to be accessible from the internet
variable "public_subnet_cidr" {
  description = "Public Subnet cidr block"
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}

#These Private subnets can be used to deploy resources that do not need to be accessible from the internet.
variable "private_subnet_cidr" {
  description = "Private Subnet cidr block"
  type        = list(string)
  default     = ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
}

#This is a Environement variable 
variable "environment" {
  description = "Environment name for deployment"
  type        = string
  default     = "contoso-dev"
}

# This is a Region Variable
variable "aws_region" {
  description = "AWS region name"
  type        = string
  default     = "ap-southeast-1"
}

variable "height" {
  default     = "400"
  description = "Image height in pixels."
}

variable "width" {
  default     = "600"
  description = "Image width in pixels."
}

variable "placeholder" {
  default     = "placekitten.com"
  description = "Image-as-a-service URL. Some other fun ones to try are fillmurray.com, placecage.com, placebeard.it, loremflickr.com, baconmockup.com, placeimg.com, placebear.com, placeskull.com, stevensegallery.com, placedog.net"
}
