module "database-servers" {
  for_each = var.database_servers
  source = "./module"
  component_name = each.value["name"]
  env = var.env
  instance_type = each.value["instance_type"]
  password = lookup(each.value, "password", "null")
  provisioner = true
  app_type = "db"
}
# done
module "app-servers" {
  depends_on = [module.database-servers]
  for_each = var.app_servers
  source = "./module"
  component_name = each.value["name"]
  env = var.env
  instance_type = each.value["instance_type"]
  password = lookup(each.value, "password", "null")
  provisioner    = true
  app_type = "app"
}

# resource "aws_instance" "frontend" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "frontend"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "catalogue" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "frontend-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.catalogue.private_ip]
# }
#
# resource "aws_instance" "catalogue" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "catalogue"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "catalogue" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "catalogue-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.catalogue.private_ip]
# }
#
# resource "aws_instance" "mongodb" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "mongodb"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "mongodb" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "mongodb-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.mongodb.private_ip]
# }
#
# resource "aws_instance" "redis" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "redis"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "redis" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "redis-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.redis.private_ip]
# }
#
# resource "aws_instance" "user" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "user"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "user" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "user-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.user.private_ip]
# }
#
# resource "aws_instance" "cart" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "cart"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "cart" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "cart-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.cart.private_ip]
# }
#
# resource "aws_instance" "mysql" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "mysql"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "mysql" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "mysql-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.mysql.private_ip]
# }
#
# resource "aws_instance" "shipping" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "shipping"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "shipping" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "shipping-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.shipping.private_ip]
# }
#
# resource "aws_instance" "rabbitmq" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "rabbitmq"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "rabbitmq" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "rabbitmq-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.rabbitmq.private_ip]
# }
#
# resource "aws_instance" "payment" {
#  ami = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#
#  tags = {
#    Name = "payment"
#  }
# }
# # Aws route53 zone created
# resource "aws_route53_record" "payment" {
#  zone_id = "Z046601226CDZON0ON24A"
#  name    = "payment-dev.aws.automation-dev.us"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.payment.private_ip]
# }




