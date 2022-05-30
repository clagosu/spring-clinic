node {
  env.SONAR_TOKEN='d00b6c50cb81f6cd8c86fe2e200d7c20fa2c1254'

  stage('Git'){
    checkout scm
  }

  stage('Build'){
    sh "chmod 777 gradlew"
    sh "./gradlew build"
  }
  
  stage('Test'){
    sh "./gradlew clean test"
  }

  stage('Sonarqube') {
      sh "set +x; ./gradlew sonarqube -Dsonar.login=${SONAR_TOKEN} -Dsonar.branch.name=feature-gonzaloFernandez-interfaz"
  }

  stage('Image Build') {
    steps {
        withDockerRegistry(credentialsId: 'gfernandeznunez:66f36f48-3ae2-4950-b3ab-bd7db187caea', url: 'https://hub.docker.com') {
            sh 'docker build .'
            sh 'docker push'
        }
    }
  }
}