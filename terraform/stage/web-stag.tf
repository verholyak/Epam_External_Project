resource "aws_instance" "web-stag" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-stag.id]
  user_data              = file("user_data.sh")
  key_name               = "key_for_ansible" 
  tags = {
    Name  = "STAG WebServer"
    Owner = "Vova Verholyak"
  }
}

resource "aws_security_group" "web-stag" {
  name        = "WebServer SG Stag"
  description = "My Stage SecurityGroup"

  dynamic "ingress" {
    for_each = var.allow_ports        // variables
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web Server SecurityGroup"
    Owner = "Vova Verholyak"
  }
}

resource "aws_eip" "web-stag" {
  instance = aws_instance.web-stag.id
  tags = {
    Name  = "PROD WebServer IP - ${terraform.workspace}"
    Owner = "Vova Verholyak"
  }
}

####################################
output "web_public_ip" {
  value = aws_eip.web-stag.public_ip
}