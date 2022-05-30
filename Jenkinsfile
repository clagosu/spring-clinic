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
    //stage('Sonarqube') {
    //    sh "set +x; ./gradlew sonarqube -Dsonar.login=${SONAR_TOKEN} -Dsonar.branch.name=feature-gonzaloFernandez-interfaz"
    //}

    //stage('Docker'){
    //    withDockerRegistry(credentialsId: 'docker', url: 'https://hub.docker.com') {
    //        sh 'docker build .'
    //        sh 'docker push'
    //    }
    //}

    //stage('Docker'){
    //    sh 'gradle docker'
    //}
}