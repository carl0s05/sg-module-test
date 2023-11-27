# Id del grupo de seguridad creado.
output "sg_group_id" {
  description = "Id del grupo de seguridad creado"
  value       = aws_security_group.sg_group.id
}

# Nombre del grupo de seguridad creado.
output "sg_group_name" {
  description = "Nombre del grupo de seguridad creado"
  value       = aws_security_group.sg_group.name
}

# Descripción del grupo de seguridad creado.
output "sg_group_description" {
  description = "Descripcion del grupo de seguridad creado"
  value       = aws_security_group.sg_group.description
}

# Reglas de seguridad de ingreso (ingress).
output "sg_group_ingress_rules" {
  description = "Reglas de seguridad de ingreso (ingress)"
  value       = aws_security_group.sg_group.ingress
}

# Puertos de origen, destino y protocolo de las reglas de seguridad de entrada (ingress).
output "sg_group_ingress_port_and_protocol" {
  description = "Puertos de origen, destino y protocolo de las reglas de seguridad de entrada (ingress)"
  value = [
    for ingress in aws_security_group.sg_group.ingress :
    {
      from_port = ingress.from_port
      to_port   = ingress.to_port
      protocol  = ingress.protocol
    }
  ]
}

# Reglas de seguridad de salida (egress).
output "sg_group_egress_rules" {
  description = "Reglas de seguridad de salida (egress)"
  value       = aws_security_group.sg_group.egress
}

# Puertos de origen, destino y protocolo de las reglas de seguridad de salida (egress).
output "sg_group_egress_port_and_protocol" {
  description = "Puertos de origen, destino y protocolo de las reglas de seguridad de salida (egress)"
  value = [
    for egress in aws_security_group.sg_group.egress :
    {
      from_port = egress.from_port
      to_port   = egress.to_port
      protocol  = egress.protocol
    }
  ]
}