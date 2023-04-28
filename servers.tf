data "aws_ami" "centos" {
  owners           = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "allow-all" {
  name = "allow-all"
}

variable "instance_type" {
  default = "t3.small"
}

variable "components" {
  default = ["frontend","mongodb","catalogue","user","cart","redis","mysql","shipping","rabbitmq","payment"]
}
resource "aws_instance" "instance" {
              count = length(var.components)
              ami          = data.aws_ami.centos.image_id
              instance_type = var.instance_type
              vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.components[count.index]
  }
}
variable "records" {
  default = ["frontend-dev.pavan345.online","mongodb-dev.pavan345.online","catalogue-dev.pavan345.online","user-dev.pavan345.online", "cart-dev.pavan345.online","redis-dev.pavan345.online","mysql-dev.pavan345.online","shipping-dev.pavan345.online","rabbitmq-dev.pavan345.online","payment-dev.pavan345.online"]
  }

 resource "aws_route53_record" "dns_records" {
   count = length(var.records)
    zone_id = "Z08045122E2EQN1OR1WS6"
    name    = var.records[count.index]
    type    = "A"
    ttl     = 30
    records = [aws_instance.instance[count.index].private_ip]
  }

//output "frontend" {
//value = aws_instance.frontend.public_ip
//}
