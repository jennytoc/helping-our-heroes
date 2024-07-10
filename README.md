# helping-our-heroes

## Workflows in repo:
- DO_NOT_TOUCH: runs on push to main, runs terraform, builds docker image, pushes to Elastic Container Registry (AWS ECR).
- Terraform Plan: runs on push to dev, tests terraform scripts for errors
- PullRequestTesting: runs on pull request from main, tests install of frontend and backend
- docker-image: runs on workflow dispatch, builds docker image, pushes to DockerHub instead of ECR. (Used to test Docker Image outside regular workflow)
