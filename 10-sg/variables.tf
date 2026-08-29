variable "sg_names" {
    default = ["eks_node_sg_id", "eks_control_plane_sg_id", "bastion_sg_id"]
}

variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "stage"
}
