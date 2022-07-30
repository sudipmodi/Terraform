#  AMI ID for Ubuntu-20
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = [ "143027907197" ] # This is Canonical ID
  filter {
    name = "name"
    values = [ "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}