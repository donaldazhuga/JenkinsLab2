pipeline {
    agent any  // Runs on any available Jenkins agent

    tools {
        maven 'Maven 3.9.9'  // Use the Maven you configured in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Clones your GitHub repo
                git branch: 'main', url: 'https://github.com/donaldazhuga/JenkinsLab2.git'
            }
        }

        stage('Build') {
            steps {
                // Build the Maven Web App
                bat 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                // Run tests (if you have any)
                bat 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                // Simulate deployment (e.g., copying the .war file)
                echo 'Deploying the web app...'
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
                sh 'docker build -t your-dockerhub-username/your-image-name:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push your-dockerhub-username/your-image-name:latest'
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
