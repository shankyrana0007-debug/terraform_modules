resource aws_key_pair my_key {
key_name = "${var.env}-infra-app-key"
public_key = file("terra-key-ec2.pub")

tags = {
Environment = var.env

}
}


resource aws_default_vpc default {


}

resource aws_security_group allow_tls {
name = "${var.env}-infra-app-sg"
description = "will add tf generated security group"
vpc_id = aws_default_vpc.default.id #interpolation

  
# Inbound rules
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
description = "SSH open"
}

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
description = "HTTP open"

}

ingress {
from_port = 8000
to_port = 8000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
description = "app open"

}
# Outbound rules
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
description = "all access"
}

tags = {
Name = "${var.env}-infra-app-sg"

}
}

# create ec2
resource aws_instance my_instance {
count = var.instance_count

               # meta arguement
key_name = aws_key_pair.my_key.key_name
security_groups = [aws_security_group.allow_tls.name]
instance_type = var.instance_type
ami = var.ec2_ami_id #Ubuntu


root_block_device {
    volume_size = var.env == "prd" ? 15 : var.ec2_default_root_storage_size
    volume_type = "gp3"
}

tags= {

Name = "${var.env}-infra-app-instance"
Environment = var.env
}



}
