variable "common_tags" {
    default = {
        project = "roboshop"
        environment = "dev"
        terraform = "true"
    }
}
variable "tags" {
    default = {
        Component = "catalogue"
    }
}
variable "project_name" {
    default = "roboshop"
}
variable "environment" {
    default = "dev"
}
variable "zone_name" {
    default = "sowjanyaaws.online"
}
variable app_version{
    
}