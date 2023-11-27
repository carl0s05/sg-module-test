# Define una variable local que se usará como sufijo en los nombres de los recursos.
locals {
  postfix_name = "bcpl-sg-${var.environment}-${var.partial_name}"
}

# Define un grupo de seguridad en AWS.
resource "aws_security_group" "sg_group" {
  name        = "${local.postfix_name}"
  description = var.security_group_config.description
  vpc_id      = var.vpc_id

  # Define reglas de ingreso de manera dinámica.
  dynamic "ingress" {
    for_each = var.security_group_config.ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      self        = ingress.value.self
      description = ingress.value.description
    }

  }

  # Define reglas de salida de manera dinámica.
  dynamic "egress" {
    for_each = var.security_group_config.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      self        = egress.value.self
      description = egress.value.description
    }

  }

  # Etiquetas para identificar el grupo de seguridad.
  tags = merge(var.tags, {
    "Name" = "${local.postfix_name}",
    "Service Name" = "sg"
    
  })

  lifecycle {
    ignore_changes = [tags["Date/Time"]]
  }


}