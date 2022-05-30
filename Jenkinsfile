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

node {
    env.SONAR_TOKEN = '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'
    stage('Git') {
        checkout scm
    }
    stage('Build') {
        sh 'chmod 777 gradlew'
        sh './gradlew clean build'
    }
    stage('Test'){
        sh "./gradlew clean test"
    }
    stage('Sonarqube') {
        sh "set +x; ./gradlew sonarqube -Dsonar.login=${SONAR_TOKEN} -Dsonar.branch.name=feature-gonzaloFernandez-interfaz"
    }
}