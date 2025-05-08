resource "aws_ecr_repository" "this" {
  name = "${var.name_prefix}-repo"
}

output "repository_url" {
  value = aws_ecr_repository.this.repository_url
}
