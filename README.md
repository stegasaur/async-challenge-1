# Async Challenge - Intermediate 3 - ECS

### Brief
ExplodeMe Inc is deploying a new service. It is a containerized web server that will be running on ECS Fargate. When it is deployed, the containers keep dying. It is your job to figure out why and fix it. Ultimately, the containers should be running and accessible via the load balancer. Visiting the hostname given by the Terraform stack output alb_dns_name should return "Hello World".

### Setup
1. Clone this repo
2. Install the AWS CLI and configure it with your credentials
3. Install Terraform
4. Creat a tfvars file with the variable `profile` set to your AWS profile name. This is the profile you configured in the AWS CLI.
5. Run `terraform init` to initialize the Terraform project.
6. Run `terraform apply --var-file=<TFVARS_FILE_PATH>` to create the resources.
7. Check the ECS console to see the status of the containers.

### Technical Notes
The container is a simple web server that returns "Hello World" when accessed. The container is running on ECS Fargate with a load balancer in front of it. The load balancer is configured to route traffic to the container.

### Warning
This spins up a VPC and NAT gateway that you get charged for hourly. It costs about $30 a month but feel free to double-check me on that.

Again please familiarize yourself with the AWS pricing structure for all technologies used in the async challenges.

### Definition Of Done
- The ECS service should reach a steady state with 2 tasks running.
- Visiting the hostname given by the Terraform stack output alb_dns_name should return "Hello World".

### Teardown
To spin this down run

terraform destroy
