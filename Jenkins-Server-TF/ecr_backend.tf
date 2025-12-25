resource "aws_ecr_repository" "backend_ecr" {
    name = "backend_ecr"
    image_tag_mutability = "MUTABLE"

    tags = {
        Name = "backend_ecr"
    }
}