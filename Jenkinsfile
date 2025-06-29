pipeline {
    agent any
    
    stages {
        stage ("clean workspace") {
            steps {
                cleanWs()
            }
        }
        stage ("Git Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/sandiphonemyint/Netflix-dev.git'
            }
        }
        stage('OWASP FS SCAN') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DP-Check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        stage ("Build Docker Image") {
            steps {
                sh "docker build -t netflix ."
            }
        }
        stage ("Tag & Push to Dockerhub") {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker') {
                        sh "docker tag netflix sandiphonemyint/netflix:latest"
                        sh "docker push sandiphonemyint/netflix:latest"
                    }
                }
            }
        }
        stage ("Docker Scout Image Analysis") {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker') {
                        sh "docker-scout quickview sandiphonemyint/netflix:latest"
                        sh "docker-scout cves sandiphonemyint/netflix:latest"
                        sh "docker-scout recommendations sandiphonemyint/netflix:latest"
                        
                    }
                }
            }
        }
        stage ("Deploy to Container") {
            steps {
                sh "docker stop netflix || true" ## optional #fixissue
                sh "docker rm netflix || true"   ## optional #fixissue
                sh "docker run -itd --name netflix -p 4000:4000 netflix:latest"
            }
        }
    }
    post {
    always {
        emailext attachLog: true,
            subject: "'${currentBuild.result}'",
            body: """
                <html>
                <body>
                    <div style="background-color: #FFA07A; padding: 10px; margin-bottom: 10px;">
                        <p style="color: white; font-weight: bold;">Project: ${env.JOB_NAME}</p>
                    </div>
                    <div style="background-color: #90EE90; padding: 10px; margin-bottom: 10px;">
                        <p style="color: white; font-weight: bold;">Build Number: ${env.BUILD_NUMBER}</p>
                    </div>
                    <div style="background-color: #87CEEB; padding: 10px; margin-bottom: 10px;">
                        <p style="color: white; font-weight: bold;">URL: ${env.BUILD_URL}</p>
                    </div>
                </body>
                </html>
            """,
            to: 'example@gmail.com',
            mimeType: 'text/html'
        }
    }
}
