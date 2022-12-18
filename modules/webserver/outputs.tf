# Defining the outputs from the webserver created in mian.tf resource "aws_subnet"
# Mutiple output values can be added to this webserver
output "instance" {
    value           = aws_instance.webserver
    description     = "Webserver contents" 
}
