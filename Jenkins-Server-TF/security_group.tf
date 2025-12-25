resource "aws_security_group" "ec2_sg" {
    vpc_id = aws_vpc.vpc.id



    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH Open"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP Open"
}

    ingress {
        from_port = 9000
        to_port = 9000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Sonar-Qube"
}

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Jenkins-Port"
    }


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
    
    tags = {
        Name= var.sg-name
    }

}
