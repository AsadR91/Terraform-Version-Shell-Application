locals {
  name = var.env != "" ? "${var.env}.${var.component_name}" : var.component_name
  db_commands = [
    "rm -rf roboshop-shell",
    "git clone https://github.com/AsadR91/Shell-Application.git",
    "cd Shell-Application",
    "sudo bash ${var.component_name}.sh ${var.password}"
  ]
  app_commands = [
    "sudo labauto ansible",
    "ansible-pull -i localhost, -U https://github.com/AsadR91/Ansible-Version-Shell-Application.git roboshop.yml -e env=${var.env} -e role_name=${var.component_name}"
  ]
  db_tags = {
    Name = "${var.env}.${var.component_name}"
  }
  app_tags = {
    Name    = "${var.env}.${var.component_name}"
    Monitor = "true"
  }
}