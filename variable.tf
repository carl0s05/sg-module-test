# Definición de la variable "security_group_config" que establece la configuración de los grupos de seguridad.
variable "security_group_config" {
  description = "Bloque para configuración de grupos de seguridad"
  type = object({
    name        = string
    description = string
    ingress = set(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      self        = bool
      description = string
    }))
    egress = set(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      self        = bool
      description = string
    }))
  })
}

# Definición de la variable "vpc_id" que establece el ID de la VPC a la que pertenece el grupo de seguridad deseado.
variable "vpc_id" {
  description = "ID de la VPC a la que pertenece el grupo de seguridad deseado."
  type        = string
  default     = null
}

variable "partial_name" {
  description = "Variable utilizada para el nombrado estándar de los recursos (ENGINE-ec-ENVIRONMENT)"
  type        = string
}

variable "environment" {
  description = "Variable utilizada para el nombrado estándar de los recursos"
  type        = string
}

# Definición de la variable "security_group_tags" que establece las etiquetas base para el recurso del grupo de seguridad.
variable "tags" {
  description = "Etiquetas base para el recurso, adicionalmente se asignará la etiqueta Name"
  type        = map(string)
}

