variable "secrets" {
  type = map(string)
}

variable "name" {
  type = string
}

variable "environments" {
  type    = set(string)
  default = []
}

variable "organization" {
  type = string
}

variable "auto_apply" {
  type    = bool
  default = false
}