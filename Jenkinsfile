#!groovy

pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    disableConcurrentBuilds()
  }
  environment {
      NEXUS_USER = credentials('NEXUS_USER')
      NEXUS_PASS = credentials('NEXUS_PASS')
   }
  agent any
   parameters{
    string(name: 'TAG', defaultValue: 'develop-latest', description: 'Please change the image tag.')
    choice(name: 'ECR_REPO', choices: ['blue', 'green'], description: 'Please choose ECR repo you wish to build image for?')
    string(name: 'AWS_REGION', defaultValue: 'us-west-2', description: 'Please provide AWS region for ECR repo.')
    string(name: 'NEXUS_REGISTRY', defaultValue: '52.90.1.4:8081', description: 'Private nexus registry URL.')
}
  stages {
    stage('Maven Build') {
      steps {
        script {
          sh './build.sh'
        }
      }
    }
    stage('Jar Push Private Repo') {
      steps {
        script {
          sh './push-jar.sh'
        }
      }
    }
   stage('Docker Image Build') {
      steps {
        script {
          sh './image-build.sh'
        }
      }
    }
   stage('Image Push Private Repo') {
      steps {
        script {
          sh './image-push.sh'
        }
      }
    }
}
}
