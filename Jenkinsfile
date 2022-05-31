node {
  env.SONAR_TOKEN=credentials('sonar')

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
      sh 'docker build -t gfernandeznunez/lab-spring-clinic .'
      //sh 'docker push gfernandeznunez/lab-spring-clinic'
      docker.withRegistry("https://hub.docker.com", "docker") {
        //bat "docker push gfernandeznunez/lab-spring-clinic"
        sh "docker push gfernandeznunez/lab-spring-clinic"
      }
  }
}