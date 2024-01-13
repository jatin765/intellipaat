pipeline {
    agent any

    stages{
        stage('Clean Workspace'){
            steps{
                cleanWs()
            }
        }

        stage('Checkout from Git'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jatin765/intellipaat.git']])
            }
        }

        stage('Build the image'){
            steps{
                echo 'build is successful'
            }
        }

        stage('Build the Docker Image'){
            steps{
                script{
                    sh 'docker build -t intellipaat . '
                }
            }
        }

        stage('Push the Image'){
            steps{
                script{
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker'){

                        sh 'docker tag intellipaat jatin765/intellipaat:latest'
                        sh 'docker push jatin765/intellipaat:latest'

                    }
                }
            }
        }

        stage('Run Container'){
            steps{
                sh 'docker run -d -p 80:80 jatin765/intellipaat:latest'
            }
        }

        stage('Deploy to Kubernets'){
            steps{
                withKubeConfig(credentialsId: 'kube-config', serverUrl: 'https://12.0.1.56:6443'){
                    sh 'kubectl apply -f deployment.yml'
                }
            }
        }

    } 
}
