resource "aws_instance" "frontend" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}

output "frontend" {
  value = aws_instance.frontend.public_ip
}

/*
resource "aws_route53_record" "frontend" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "frontend-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "mongodb"
  }
}
resource "aws_route53_record" "mongodb" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "mongodb-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}


resource "aws_instance" "catalogue" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }
}
resource "aws_route53_record" "catalogue" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "catalogue-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}


resource "aws_instance" "user" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "user"
  }
}
resource "aws_route53_record" "user" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "user-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "cart"
  }
}
resource "aws_route53_record" "cart" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "cart-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}



resource "aws_instance" "redis" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "redis"
  }
}
resource "aws_route53_record" "redis" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "redis-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}


resource "aws_instance" "mysql" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "mysql"
  }
}
resource "aws_route53_record" "mysql" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "mysql-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}


resource "aws_instance" "shipping" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "shipping"
  }
}
resource "aws_route53_record" "shipping" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "shipping-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}


resource "aws_instance" "rabbitmq" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "rabbitmq"
  }
}
resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "rabbitmq-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}


resource "aws_instance" "payment" {
  ami           = "ami-0b5a2b5b8f2be4ec2"
  instance_type = "t3.micro"

  tags = {
    Name = "payment"
  }
}
resource "aws_route53_record" "payment" {
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "payment-dev.pavan345.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}
