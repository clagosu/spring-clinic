#FROM openjdk:8-jre

LABEL maintainer="darwinhm@gmail.com"
EXPOSE 8090
#ADD gradle/wrapper/gradle-wrapper.jar /app/app.jar
WORKDIR /app

FROM anapsix/alpine-java 
COPY /target/spring-petclinic-1.5.1.jar /home/spring-petclinic-1.5.1.jar 

CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]
