resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.this.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y curl
              curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
              apt install -y nodejs
              npm install -g yarn pm2
              npx create-strapi-app@latest strapi --quickstart
              pm2 start npm --name strapi -- start --prefix /root/strapi
              EOF

  tags = {
    Name = "Strapi-EC2"
  }
}
