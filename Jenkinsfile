node {
  env.SONAR_TOKEN='d00b6c50cb81f6cd8c86fe2e200d7c20fa2c1254'
  stage('Build'){
    checkout scm
    sh "chmod 777 gradlew"
    sh "./gradlew build"
  }
  
  stage('Test'){
    sh "./gradlew clean test"
  }

  stage('Sonarqube') {
      sh "set +x; ./gradlew sonarqube -Dsonar.login=${SONAR_TOKEN} -Dsonar.branch.name=feature-gonzaloFernandez-interfaz"
  }
}