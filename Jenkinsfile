#!groovy

pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    disableConcurrentBuilds()
  }
  environment {
      NEXUS_USER = credentials('NEXUS_USER')
      NEXUS_PASS = credentials('NEXUS_PASS')
      DOCKER_USER = credentials('DOCKER_USER')
      DOCKER_PASS = credentials('DOCKER_PASS')
   }
   }
  agent any
   parameters{
    string(name: 'TAG', defaultValue: 'develop-latest', description: 'Please change the image tag.')
    string(name: 'REGISTRY', defaultValue: '52.90.1.4:5000', description: 'Private registry id.')
}
  stages {
    stage('Maven Build') {
      steps {
        script {
          sh '''
            build.sh
          '''
        }
      }
    }
    stage('Nexus Jar Push') {
      steps {
        script {
          sh '''
            push-jar.sh
          '''
        }
      }
    }
   stage('Docker Image Build') {
      steps {
        script {
          sh '''
            image-build.sh
          '''
        }
      }
    }
   stage('Docker Image Push') {
      steps {
        script {
          sh '''
            image-push.sh
          '''
        }
      }
    }
}
}
