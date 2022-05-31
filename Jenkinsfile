node {
  env.SONAR_TOKEN='d00b6c50cb81f6cd8c86fe2e200d7c20fa2c1254'

  stage('Checkout'){
    checkout scm
  }

  stage('Build'){
    sh "chmod 777 gradlew"
    sh "./gradlew build"
  }
  
  stage('Test'){
    sh "./gradlew clean test"
  }

  stage('Code Review') {
    sh "set +x; ./gradlew sonarqube -Dsonar.login=${SONAR_TOKEN} -Dsonar.branch.name=feature-gonzaloFernandez-interfaz"
  }

  stage('Deploy') {
    def dockerHome = tool 'docker'
    env.PATH = "${dockerHome}/bin:${env.PATH}"
    boolean buildOK = true
    try{
      sh 'docker build -t gfernandeznunez/lab-spring-clinic .'
    } catch (Exception e){
      buildOK = false;
    }

    if(buildOK){
      docker.withRegistry("https://hub.docker.com", "docker") {
        sh "docker push gfernandeznunez/lab-spring-clinic"
      }
    }
  }
}