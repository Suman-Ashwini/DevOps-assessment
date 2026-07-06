pipeline { agent any environment { AWS_DEFAULT_REGION = "us-east-1" } stages {
stage("Checkout") { steps { checkout scm echo "Code checked out from GitHub
successfully" } } stage("Terraform Init") { steps { dir("terraform") { sh "terraform
init" } } } stage("Terraform Plan") { steps { dir("terraform") { sh "terraform plan" } }
} stage("Terraform Apply") { steps { dir("terraform") { sh "terraform apply
-auto-approve" } } } } post { success { echo "Infrastructure created successfully on
AWS!" } failure { echo "Pipeline failed. Check the Console Output above for errors." } }
}
