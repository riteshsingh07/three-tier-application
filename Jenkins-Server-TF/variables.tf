variable "vpc-name" {
    default = "three-tier-vpc"
    type = string
}
variable "igw-name" {
    default = "three_tier_igw"
    type = string
}
variable "rt-name" {
    default = "three_tier_rt"
    type = string
}
variable "sg-name" {
    default = "three_tier_sg"
    type = string
}
variable "key-name" {
    default  = "three_tier_key"
    type = string
}