FROM openjdk:8-jre

EXPOSE 8080

ADD build/libs/testing-web-0.0.1-SNAPSHOT.jar /app/app.jar

WORKDIR /app
CMD java -jar app.jar

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz