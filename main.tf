resource "aws_instance" "sql_server" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = local.host_name
  }
}

