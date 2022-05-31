FROM openjdk:11-jdk-oraclelinux7
EXPOSE 8090
ADD spring-petclinic.jar /app/app.jar
WORKDIR /app
CMD java -jar app.jar
