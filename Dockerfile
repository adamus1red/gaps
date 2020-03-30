FROM openjdk:11.0.6-jre-slim

MAINTAINER jh5975@gmail.com

EXPOSE 32400

RUN mkdir -p /usr/data

COPY movieIds.json /tmp

RUN mkdir -p /usr/app

WORKDIR /usr/app

COPY GapsWeb/target/GapsWeb-0.2.2.jar /usr/app/

ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=ssl", "GapsWeb-0.2.2.jar"]