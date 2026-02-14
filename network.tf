

locals {
  vpc_ip = "192.168.0.0"
  network_bit = 16

  network_bit_for_subnet = 28

  cicd = "${local.vpc_ip}/${local.network_bit}"

  avaliable_subnets = cidrsubnets(cicd, local.network_bit_for_subnet - local.network_bit)
}

variable "CICD" {
  type = string
  default = local.vpc_ip
}