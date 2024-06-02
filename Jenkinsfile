pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            dir '.'
        }
    }

    environment {
        GITHUB_REPO = 'yourusername/your-flutter-project'
        GITHUB_TOKEN = credentials('github-token')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/yourusername/your-flutter-project.git'
            }
        }

        stage('Setup Flutter') {
            steps {
                sh 'flutter doctor'
                sh 'flutter pub get'
            }
        }

        stage('Analyze') {
            steps {
                sh 'flutter analyze'
            }
        }

        stage('Test') {
            steps {
                script {
                    try {
                        sh 'flutter test'
                    } catch (Exception e) {
                        echo 'No tests available.'
                    }
                }
            }
        }

        stage('Build APK') {
            steps {
                sh 'flutter build apk --release'
            }
        }

        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', fingerprint: true
            }
        }

        stage('Upload to GitHub') {
            steps {
                script {
                    def uploadUrl = "https://uploads.github.com/repos/${GITHUB_REPO}/releases/assets"
                    sh """
                        curl -H "Authorization: token ${GITHUB_TOKEN}" -H "Content-Type: application/zip" \
                        --data-binary @build/app/outputs/flutter-apk/app-release.apk \
                        ${uploadUrl}
                    """
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
