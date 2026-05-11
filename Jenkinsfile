def runMaven(String goals) {
    if (isUnix()) {
        sh "mvn ${goals}"
    } else {
        bat "mvn ${goals}"
    }
}

pipeline {
    agent any
    stages {
        stage('Clean') {
            steps {
                script {
                    runMaven('clean')
                }
            }
        }
        stage('Compile') {
            steps {
                script {
                    runMaven('compile')
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    runMaven('test -Dmaven.test.failure.ignore=true')
                }
            }
        }
        stage('JaCoCo') {
            steps {
                script {
                    runMaven('jacoco:report')
                }
            }
        }
        stage('Javadoc') {
            steps {
                script {
                    runMaven('javadoc:javadoc')
                }
            }
        }
        stage('Site') {
            steps {
                script {
                    runMaven('site')
                }
            }
        }
        stage('Package') {
            steps {
                script {
                    runMaven('package -DskipTests')
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '**/target/site/**/*.*', fingerprint: true, allowEmptyArchive: true
            archiveArtifacts artifacts: '**/target/**/*.jar', fingerprint: true, allowEmptyArchive: true
            archiveArtifacts artifacts: '**/target/**/*.war', fingerprint: true, allowEmptyArchive: true
            junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
        }
    }
}
