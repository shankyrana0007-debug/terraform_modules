variable "ec2_instance_type" {
    default = "t3.small"
    type = string

}

variable "ec2_default_root_storage_size" {
    default = 8
    type = number

}


variable "env" {
description = "This is the Environment for infra"
type = string

}

variable "bucket_name" {
description = "This is my bucket name"
type = string


}

variable "instance_count" {
description = "this is number of ec2 instance"
type = string

}

variable "instance_type" {
description = "this is instance type of ec2 instance"
type = string

}

variable "ec2_ami_id" {
description = "this is ami id of ec2 instance"
type = string

}

variable "hash_key" {
description = "this is hash key for my user"
type =string
}
