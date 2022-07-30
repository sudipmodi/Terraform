@Library('github.com/releaseworks/jenkinslib') _

pipeline {
    agent any
    environment {
        registry = "465786332756.dkr.ecr.us-east-1.amazonaws.com/upgrad-assignment/node"
    }

    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/ms-sourcetech/terraform-ansible-jenkins.git']]])
            }
        }

    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }

    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
        steps{
            script {
                sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 465786332756.dkr.ecr.us-east-1.amazonaws.com/upgrad-assignment/node '
                sh 'docker push 465786332756.dkr.ecr.us-east-1.amazonaws.com/upgrad-assignment/node'
            }
        }
    }

    stage('Docker Run') {
     steps{
         script {
             sshagent(credentials : ['aws_ec2']){

                sh 'ssh -o StrictHostKeyChecking=no -i upgrad-project.pem ubuntu@10.0.2.129'

             }
                //sh 'ssh -i /login/upgrad-project.pem ubuntu@10.0.2.129'
                sh 'docker run -d -p 8081:8080 --rm --name node 465786332756.dkr.ecr.us-east-1.amazonaws.com/upgrad-assignment/node'
            }
      }
    }
    }
}