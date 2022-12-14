data "aws_ami" "amzn2_ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

}

resource "aws_instance" "lambdaguard_ec2" {
  ami                    = data.aws_ami.amzn2_ami.id
  instance_type          = "t2.micro"
  key_name               = "LG_KP"
  subnet_id              = aws_subnet.LG_VPC_subnet_1.id
  vpc_security_group_ids = [aws_security_group.LG_SG.id]
  user_data              = <<-EOF
                    #!/bin/bash
                    sudo amazon-linux-extras enable nginx1
                    sudo yum clean metadata
                    sudo yum update -y
                    sudo yum install nginx -y
                    sudo systemctl enable nginx 
                    sudo systemctl start nginx
                    pip3 install lambdaguard
                EOF
  tags = {
    Name = "LG-EC2"
  }
}