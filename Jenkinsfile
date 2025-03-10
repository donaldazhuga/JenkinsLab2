pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/donaldazhuga/JenkinsLab2.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-password', variable: 'DOCKER_HUB_PASSWORD')]) {
                    sh 'echo $DOCKER_HUB_PASSWORD | docker login -u your-dockerhub-username --password-stdin'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t your-dockerhub-username/your-image-name .'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push your-dockerhub-username/your-image-name'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the web app...'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
