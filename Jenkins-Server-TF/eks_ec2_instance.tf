resource "aws_instance" "eks_ec2_instance" {
    ami = "ami-02b8269d5e85954ef"
    instance_type = "m7i-flex.large"
    key_name= aws_key_pair.ec2_key.key_name 
    subnet_id = aws_subnet.public[0].id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    associate_public_ip_address = true 

    user_data = file("eks_install.sh")

    root_block_device {
        volume_size = 15
        volume_type = "gp3"
    }

    tags = {
        Name= "three_tier_eks_server"
    }
}