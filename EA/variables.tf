variable "ami" {
  description = "AMI to be used to launch the instances"

  #	default = "ami-1e26a808"
  # default = "ami-d8bdebb8"
  default = "ami-cd0f5cb6" #ubuntu16.04
}

variable "instance_type" {
  type        = "map"
  description = "types for the Prod, staging and Dev instances"

  default = {
    prod  = "t2.micro"
    stage = "t2.micro"
    dev   = "t2.micro"
  }
}

variable "subnet" {
  description = "private subnet where the instance it's going to be launched"

  default = "subnet-2d408d75"
}

variable "key_name" {
  description = "name of the key that it's going to be used, this mus be created on the AWS console"
}

variable "env" {
  description = "Name of the application, global environment, it's going to be used to name the instances"
}

#variable "sub_domain" {
#  description = "subdomain that it's going to be used as base to create the env records (value+dev.somedomain.com), by default this value it's going to correspond to the production env"
#}