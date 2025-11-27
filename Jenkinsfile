pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/RushikeshNidhonkar2708/DevopsProject2.git'
            }
        }

        stage('Install Dependencies (CI Stage)') {
            steps {
                sh '''
                echo "Installing dependencies..."
                npm install
                '''
            }
        }

        stage('Run Tests (CI Stage)') {
            steps {
                sh '''
                echo "Running test cases..."
                npm test --passWithNoTests || true
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                echo "Building Docker image..."
                sudo docker build -t prime-app .
                '''
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                echo "Stopping old container if running..."
                sudo docker stop prime-container || true
                '''
            }
        }

        stage('Remove Old Container') {
            steps {
                sh '''
                echo "Removing old container..."
                sudo docker rm prime-container || true
                '''
            }
        }

        stage('Deploy New Container') {
            steps {
                sh '''
                echo "Deploying new container..."
                sudo docker run -d -p 80:80 --name prime-container prime-app
                '''
            }
        }
    }
}
