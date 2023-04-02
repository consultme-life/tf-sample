resource "aws_ecr_repository" "ecr_repo" {
  name = "${local.tags["name"]}-ecr"

  image_scanning_configuration {
    scan_on_push = true
  }
}