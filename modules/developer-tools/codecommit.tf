resource "aws_codecommit_repository" "repo" {
  repository_name = var.source_repo_name
  description     = "This is the codecommit Repository"
}

output "source_repo_clone_url_http" {
  value = aws_codecommit_repository.repo.clone_url_http
}
