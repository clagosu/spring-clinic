ENTRYPOINT ["chmod 777", "/var/jenkins_home/workspace/testbuild22@tmp/durable-ec04471e/script.sh"]
FROM openjdk:8-jre
LABEL maintainer="darwinhm@gmail.com"
EXPOSE 8090
ADD gradle/wrapper/gradle-wrapper.jar /app/app.jar
WORKDIR /app
CMD java -jar app.jar

