FROM openjdk:8-jre
LABEL maintainer="darwinhm@gmail.com"
EXPOSE 8090
ADD build/libs/testing-web-0.0.1-SNAPSHOT.jar /app/app.jar
WORKDIR /app
CMD java -jar app.jar

