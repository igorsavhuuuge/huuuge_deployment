pipeline {
    environment {
        registry = "igorsavdocker/huuuge_app"
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
    agent { label 'master' }
    stages{
        stage('application') {
            steps {
                sh 'mkdir -p application'
                dir("application")
                        {
                            git branch: "master",
                                    url: 'https://github.com/komarserjio/notejam.git'
                        }
            }
        }

        stage('deployment') {
            steps {
                sh 'mkdir -p deployment'
                dir("deployment")
                        {
                            git branch: "main",
                                    credentialsId: 'github_huuuge',
                                    url: 'https://github.com/igorsavhuuuge/huuuge_deployment.git'
                        }
            }
        }
        stage('build') {
            steps {
                sh 'cp deployment/dockerfilesDir/Dockerfile  application/flask/Dockerfile'
                sh "cd application/flask && docker build -t igorsavdocker/huuuge_app:$BUILD_NUMBER ."
            }
        }

        stage('Deploy our image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}
