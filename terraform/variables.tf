variable region {
  type = string
  default = "Provide region"

}

variable vpc_cidr {
  type = string
  default = "Provide vpc cidr block"

}

variable subnet1_cidr {
  type = string
  default = "Provide subnet1 cidr block"

}

variable subnet2_cidr {
  type = string
  default = "Provide subnet2 cidr block"

}

variable subnet3_cidr {
  

}

variable ip_on_lunch {
  type = bool


}

variable instance_type {
  type = string

}






# variable "availability_zone" {
#   type = string
#   default = "us-east-2a"
# }

# variable "instanceCount" {
#   type = number
#   default = 1
# }

# variable "ami" {
#   type = string
#   default = "ami-050cd642fd83388e4"
# }

# variable "instance_size" {
#   type = string
#   default = "t2.micro"
# }

# variable "port" {
#   type = list
#   default = [22,80,443]
# }


# variable "key_name" {
#   type = string
#   default = "Bastion-key"
# }