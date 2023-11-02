variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}
variable "project" {
  default = "felix"
}
variable "zone1a" {
  default = "us-east-1a"
}
variable "zone1b" {
  default = "us-east-1b"
}
variable "centos" {
  default = "ami-002070d43b0a4f171"
}
variable "ubuntu" {
  default = "ami-0fc5d935ebf8bc3bc"
}
variable "key-pair" {
  default = "lab1"
}
