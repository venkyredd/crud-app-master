resource "aws_ecs_cluster" "this" {
  name = "${var.name_prefix}-cluster"
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.this.id
}
