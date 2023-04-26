data "aws_ami" "centos" {
  owners           = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
}
data "aws_security_groups" "allow-all" {
  name = "allow-all"
}
variable "instance_type" {
  default = "t3.small"
}

variable "components" {
  default = ["frontend","mongodb","catalogue"]
}
resource "aws_instance" "components" {
  ami           = data.aws_ami.centos.image_id
 instance_type = var.instance_type
  vpc_security_group_ids = data.aws_security_groups.allow-all.id


  tags = {
    Name = var.components[count.index]
  }
}

  resource "aws_route53_record" "components" {
    zone_id = "Z08045122E2EQN1OR1WS6"
    name    = "(components)-dev.pavan345.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.components.private_ip]
  }

//output "frontend" {
//value = aws_instance.frontend.public_ip
//}
