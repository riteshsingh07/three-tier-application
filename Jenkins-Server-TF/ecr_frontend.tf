resource "aws_ecr_repository" "frontend_ecr" {
    name = "frontend_ecr"
    image_tag_mutability = "MUTABLE"

    tags = {
        Name = "frontend_ecr"
    }
}