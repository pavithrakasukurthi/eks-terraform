variable "sg_names" {
    default = ["eks_node", "eks_control_plane", "bastion"]
}

variable "project" {
    default = "todo"
}

variable "environment" {
    default = "stage"
}
