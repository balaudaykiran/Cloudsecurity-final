resource "aws_security_group" "lab6_sg" {
  name        = "lab6_sg"
  description = "Remote SSH"
  vpc_id      = aws_vpc.lab6_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "lab6_security" {
  ami           = "ami-0f403e3180720dd7e"
  instance_type = "t2.micro"
  subnet_id      = aws_subnet.lab6_subnet.id  
  tags = {
    Name        = "Lab6-ec2"
    Owner       = "uday"
  }
iam_instance_profile = aws_iam_instance_profile.example_profile.name
}

resource "aws_iam_instance_profile" "example_profile" {
  name = "example_profile"
  role = aws_iam_role.example_role.name
}
