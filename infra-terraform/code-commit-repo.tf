resource "aws_codecommit_repository" "repo" {
  repository_name = "wordpress"
  default_branch = "master"
}

