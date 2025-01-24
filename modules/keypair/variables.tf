variable "key_algorithm" {
  description = "This is the key algorithm"
  default = "RSA"
}
variable "rsa_bits_size" {
  default = 2048
}
variable "the_key_name" {
  
}
variable "pem_file_name" {
  
}
variable "pem_file_permission" {
  default = 400
}

variable "subnet_id" {
  description = "the subnet id for ec2 instance"
  type = string
}

variable "instance_type" {
  description = "The type of EC2 instance"
  default     = "t2.micro"
}