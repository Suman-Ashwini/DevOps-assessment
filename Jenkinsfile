pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = "us-east-1"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        echo 'Code checked out from GitHub successfully'
      }
    }

    stage('Terraform Init') {
      steps {
        dir('Terraform') {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir('Terraform') {
          sh 'terraform plan'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        dir('Terraform') {
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }

  post {
    success {
      echo 'Infrastructure created successfully!'
    }
    failure {
      echo 'Pipeline failed. Check Console Output for errors.'
    }
  }
}

