# data "aws_instance" "check_tag" {
#   filter {
#     name = "tag:Name"
#     values = [local.host_name]
#   }
# }

resource "aws_instance" "sql_server" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = local.host_name #!= data.aws_instance.check_tag ? local.host_name : "Server with this name already exist, please choose another name."
  }
  lifecycle {
    precondition {
      condition = contains(local.application, var.application)
      error_message = "The value for application must be an approved value."
    }
    precondition {
      condition = contains(local.environment, var.env)
      error_message = "The value for environment type must be an approved value. Please refer to buildsheet for approved values."
    }
    precondition {
      condition = contains(local.location, var.location)
      error_message = "The value for location/region must be an approved value."
    }
    precondition {
      condition = contains(local.resource_type, var.resource_type)
      error_message = "The value for resource type must be an approved value."
    }
    precondition {
      condition = contains(local.infra_type, var.infra_type)
      error_message = "The value for infrastructure type must be an approved value."
    }
    # precondition {
    #   condition = "${data.aws_region.current.name},${data.aws_ssm_parameter.apps.value}" == var.prefix ? false:true
    #   error_message = "Value provided for server name prefix is invalid. Value must be \"mot\" but you provided \"${var.prefix}\""
    # }
  }
}

