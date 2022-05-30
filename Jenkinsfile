/*node {
  stage('Build'){
    checkout scm
    sh "chmod 777 gradlew"
     sh "./gradlew build"
  }
  
  stage('Test'){
  sh "./gradlew clean test"
  }
}
*/

pipeline {
    agent any
    stages {
        stage('Git') {
            steps {
                checkout scm
            }
          }
        stage('Build') {
            steps {
                sh 'chmod 777 gradlew'
                sh './gradlew clean build'
            }
          }

        stage('Test'){
            sh "./gradlew clean test"
        }

        stage('Sonarqube') {
            steps {
                sh "set +x; ./gradlew sonarqube -Dsonar.login=${SONAR_TOKEN} -Dsonar.branch.name=feature-gonzaloFernandez-interfaz"
            }
        }

    }
}