pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'saisankar99/nodejs-fullstack'
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials'
        CONTAINER_NAME = 'nodejs-fullstack-container'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Saisankar99-dev/nodepipeline'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_HUB_REPO}:latest")
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("${DOCKER_HUB_REPO}:latest").push()
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker stop ${CONTAINER_NAME} || true
                docker rm ${CONTAINER_NAME} || true
                docker run -d --name ${CONTAINER_NAME} -p 3000:3000 ${DOCKER_HUB_REPO}:latest
                '''
            }
        }
    }

    post {
        always {
            sh 'docker ps -a'
        }
    }
}