pipeline {
  agent any

  stages {
    stage('Build C App') {
      agent {
        docker {
          image 'gcc:12'
        }
      }
      steps {
        sh 'gcc -static -o app src/hello.c'
      }
    }
    stage('Docker Build') {
      steps {
        sh 'docker build -t hello-c:latest .'
      }
    }
    stage('Deploy to Minikube') {
      steps {
        sh 'kubectl apply -f hello-deploy.yaml'
      }
    }
    stage('Verify') {
      steps {
        sh 'kubectl rollout status deploy/hello-c'
        sh 'kubectl logs -l app=hello-c'
      }
    }
  }
}
