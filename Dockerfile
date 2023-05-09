FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENV SPRING_PROFILES_ACTIVE=h2
ENV JAVA_OPTS="-Xmx256m -Xms128m"
ENTRYPOINT ["java","-jar","app.jar"]
EXPOSE 8090

