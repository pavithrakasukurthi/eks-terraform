variable "project" {
    default = "todo"
}

variable "environment" {
    default = "stage"
}

variable "instance_type" {
    default = "t3.small"
}

variable "bastion_tags" {
    type = map
    default = {}
}

variable "zone_id" {
    default = "Z0034753Q3D37U6HFEYZ"
}