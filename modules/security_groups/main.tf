resource "aws_security_group" "shared" {
  vpc_id = var.vpc_id
  name   = "${var.name_prefix}-sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "${var.name_prefix}-sg" }
}

output "shared_security_group_id" {
  value = aws_security_group.shared.id
}
