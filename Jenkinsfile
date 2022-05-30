pipeline {
    agent any
    stages {
        stage('SCM'){
            steps {
                checkout scm
            }
        }
        stage('Build'){
            steps {
                sh "chmod 777 gradlew"
                sh "./gradlew build"
            }
        }
        stage('Test'){
            steps {
                sh "./gradlew clean test"
            }
        }
        stage('SonarQube analysis') {
                steps {
                    withSonarQubeEnv('sonarqube') {
                        sh "./gradlew sonarqube"
                    }
                }
            }
    }
}