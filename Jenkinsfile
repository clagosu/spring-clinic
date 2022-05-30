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
        sh './gradlew build --scan -s'
      }
    }
    stage('Test'){
      steps {
        sh "./gradlew clean test"
      }
    }
    stage('Sonarqube'){
            steps{
                figlet 'SonarQube'
                script{
                    def scannerHome = tool 'sonarqube'
                    
                    withSonarQubeEnv('sonarqube'){
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.login=admin -Dsonar.password=nokias82 -Dsonar.projectKey=gradlew -Dsonar.java.binaries=. -Dsonar.exclusions='**/*/test/**/*, **/*/acceptance-test/**/*, **/*.html'"
                    }
                }
            }
    }
    stage('Deploy') {
      agent any
      steps {
        sh 'docker build -t invazhor/spring-clinic:latest .'
      }
    }
  }
} 
