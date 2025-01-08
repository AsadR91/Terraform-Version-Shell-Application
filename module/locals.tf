locals {
  name = var.env != "" ? "${var.component_name}-${var.env}" : var.component_name
  db_commands = [
    "rm -rf Shell-Application",
    "git clone https://github.com/AsadR91/Shell-Application.git",
    "cd Shell-Application",
    "sudo bash ${var.component_name}.sh ${var.password}"
  ]
  app_commands = [
    "sudo labauto ansible",
    "ansible-pull -i localhost, -U https://github.com/AsadR91/Ansible-Version-Shell-Application.git roboshop.yml -e env=${var.env} -e role_name=${var.component_name}"
  ]
  db_tags = {
    Name = "${var.component_name}-${var.env}"
  }
  app_tags = {
    Name    = "${var.component_name}-${var.env}"
    Monitor = "true"
    component = var.component_name
    env = var.env
  }
}