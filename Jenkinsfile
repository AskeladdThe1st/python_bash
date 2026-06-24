pipeline {
    agent any
    stages {
        stage('Git Checkout Code 🚕') {
            steps {
                git branch: 'main', url: 'https://github.com/AskeladdThe1st/python_bash.git'
            }
        }
        stage('Linting 🥀🥀') {
            steps {
                sh 'python3 -m flake8 . --exclude=venv,.jenkins --exit-zero'
            }
        }
        stage('Secret Scan') {
            steps {
                sh 'gitleaks detect --source . -v'
            }
        }
        stage('Security Scan') {
            steps {
                sh 'cd app && python3 security_scan.py'
            }
        }
        stage('Build and push to nexus 📦') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'nexus-registry-credentials', usernameVariable: 'NEXUS_USER', passwordVariable: 'NEXUS_PASSWORD')]) {
                    sh "docker login -u ${NEXUS_USER} -p ${NEXUS_PASSWORD} 192.168.1.56:5001"
                    sh 'docker build -f app/Dockerfile.app -t 192.168.1.56:5000/python-devsecops-registry/python-app:latest .'
                    sh 'docker push 192.168.1.56:5000/python-devsecops-registry/python-app:latest'
                }
            }
        }
        stage('Deploy to Kubernetes Cluster ☸️') {
            steps {
                sh 'kubectl apply -f deployment.yml'
            }
        }
    }
}