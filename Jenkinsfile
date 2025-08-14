pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/S2001-czentrix/Devops_Practice.git', branch: 'main'
            }
        }

        stage('Debug Path') {
            steps {
                sh 'pwd && ls -R'
            }
        }

        stage('Build C App') {
            steps {
                sh 'docker run --rm -v $WORKSPACE:/app -w /app gcc:12 gcc -static -o app src/hello.c'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t devops-c-app .'
            }
        }

        stage('Deploy to Minikube') {
            steps {
                sh 'kubectl apply -f hello-deploy.yaml'
            }
        }

        stage('Verify') {
            steps {
                sh 'kubectl get pods'
            }
        }
    }
}

