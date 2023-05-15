#FROM openjdk:13
#VOLUME /tmp
#EXPOSE 8080
#ADD ./target/FirstDevopsJob-0.0.1-SNAPSHOT.jar  FirstDevopsJob.jar
#ENTRYPOINT ["java","-jar" ,"/FirstDevopsJob.jar"]


FROM maven:3.6.3-openjdk-11-slim AS build  
WORKDIR /home/app
COPY . /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:13
VOLUME /tmp
EXPOSE 8080
COPY target/app.jar /app.jar
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
