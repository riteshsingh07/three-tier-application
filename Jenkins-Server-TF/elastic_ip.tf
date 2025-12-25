resource "aws_eip" "master_eip" {
    domain = "vpc"

    tags = {
        Name = "master_eip"
    }
}

resource "aws_eip_association" "master_eip_assoc" {
    instance_id = aws_instance.ec2_master_instance.id
    allocation_id = aws_eip.master_eip.id
}


resource "aws_eip" "agent_eip" {
    domain = "vpc"

    tags = {
        Name = "agent_eip"
    }
}

resource "aws_eip_association" "agent_eip_assoc" {
    instance_id = aws_instance.ec2_agent_instance.id
    allocation_id = aws_eip.agent_eip.id
}

