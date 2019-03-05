provider "aws" {
    access_key = "ACCESS_KEY"
    secret_key = "SECRET_KEY"
    region     = "us-east-1"
}

variable "zones" {
    default = ["us-east-1a", "us-east-1b"]
}

variable "key" {
    type    = "string"
    default = "value"
}

variable "images" {
    type    = "map"
    default = {
        "us-east-1" = "image-1234"
        "us-west-2" = "image-4567"
    }
}

variable "active" {
    default = false
}

variable "users" {
    type    = "list"
    default = ["admin", "ubuntu"]
}


resource "aws_instance" "example" {
    count               = 2
    availability_zone   = "${var.zones[count.index]}"
    ami                 = "ami-07585467"
    instance_type       = "t2.micro"
}





