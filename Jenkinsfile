pipeline {
    agent any 
    environment {
       DOCKER = tool 'docker' 
       DOCKER_EXEC = '$DOCKER/docker'
    }
    stages {
        stage('Git') {
            steps {
                checkout scm 
                //checkout([$class: 'GitSCM', branches: [[name: '*/feature-deploy']], extensions: [], userRemoteConfigs: [[credentialsId: 'clagosu', url: 'https://github.com/Devops-Foundation/microservicio-spring.git']]])
            }
        }
        
        stage('Build') {
            steps {
                sh 'chmod 777 gradlew'
                //sh './gradlew clean build'
                //archiveArtifacts artifacts: "build/libs/testing-web-*.jar"
            }
        }
        
      stage('Code Quality') {
            steps {
                sh "set -x; ./gradlew sonarqube -Dsonar.login=${SonarPAT} -Dsonar.branch.name=feature-jenkins"
                echo "$DOCKER"
                echo "$currentBuild.number"
                echo "$sonarPAT"
            }
        }
        
        stage('Image Build') {
            steps {
                //withDockerRegistry(credentialsId: 'docker', url: 'https://hub.docker.com') {
                    //sh '${DOCKER EXEC} build .'
                    sh "$DOCKER_EXEC images"
                    //sh "$DOCKER_EXEC push clagosu/spring-clinic:$currentBuild.number"
                //}
            }
        }
        
        stage('Deploy') {
            steps {
                    echo "Hello"
            }
        }
    }
}

