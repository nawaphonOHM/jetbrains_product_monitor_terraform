

variable "CICD" {
  type = string
  default = "192.168.0.0/16"
}

variable "subnet" {
  type = list(string)
  default = ["192.168.0.0/28", "192.168.0.16/28"]
}