resource "aws_instance" "instance" {
  for_each = var.components
  ami          = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = each.value["name"]
  }
}


resource "null_resource" "provisioner" {

  depends_on = [aws_instance.instance,aws_route53_record.records]

  for_each = var.components
  provisioner "remote-exec" {


    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance[each.value["name"]].private_ip
   }

    inline = [
      "rm -rf Roboshop1",
      "git clone https://github.com/Pavanyandrapati/Roboshop1",
      "cd Roboshop1",
      "sudo bash ${each.value["name"]}.sh[each.value["password"]}.private_ip
    ]
 }
}

 resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id = "Z08045122E2EQN1OR1WS6"
  name    = "${each.value["name"]}-dev.pavan345.onine"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}

