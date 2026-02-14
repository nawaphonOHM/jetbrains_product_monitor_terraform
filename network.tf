

locals {
  vpc_ip = "192.168.0.0"
  network_bit = 16

  network_bit_for_subnet = 28

  cicd = "${local.vpc_ip}/${local.network_bit}"
}