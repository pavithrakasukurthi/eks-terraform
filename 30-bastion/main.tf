resource "aws_instance" "bastion" {
    ami = local.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [local.bastion_sg_id]
    subnet_id = local.public_subnet_id

    root_block_device {
        volume_size = 50
        volume_type = "gp3" # or "gp2", depending on your preference
    }


    tags = merge(
        var.bastion_tags,
        local.common_tags,
        {
            Name = "${local.common_name}-bastion"
        }
    )
}

resource "terraform_data" "bastion" {
    connection {
        type = "ssh"
        host = "bastion.pavithra.sbs"
        user = "ec2-user"
        password = "DevOps321"
    }

    provisioner "file" {
        source = "configure.sh"
        destination = "/tmp/configure.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo sh chmod +x /tmp/configure.sh",
            "sudo sh /tmp/configure.sh"
        ]
    }
}
resource "aws_route53_record" "bastion" {
    zone_id = var.zone_id
    name = "bastion.pavithra.sbs"
    type = "A"
    ttl = 1
    records = [aws_instance.bastion.public_ip]
    allow_overwrite = true
}

