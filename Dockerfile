FROM openjdk:11-jdk-oraclelinux7
EXPOSE 8080
ADD targetspring-petclinic-2.6.0.jar /app/app.jar
WORKDIR /app
CMD java -jar app.jar
