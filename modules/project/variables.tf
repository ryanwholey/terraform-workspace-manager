variable "config" {
  type = object({
    name = string
  })
}

variable "secrets" {
  type = map(string)
}
