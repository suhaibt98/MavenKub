FROM adoptopenjdk:11-jre-hotspot

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

ENV SPRING_PROFILES_ACTIVE=h2
ENV JAVA_OPTS="-Xmx512m"

ENTRYPOINT ["java","-jar","/app.jar"]

