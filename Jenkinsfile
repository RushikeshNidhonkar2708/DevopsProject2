pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/RushikeshNidhonkar2708/DevopsProject2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'sudo docker stop prime-container || true'
                sh 'sudo docker rm prime-container || true'
                sh 'sudo docker build -t prime-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'sudo docker run -d -p 3000:3000 --name prime-container prime-app'
            }
        }
    }
}
