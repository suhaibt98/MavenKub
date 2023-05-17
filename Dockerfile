FROM openjdk:8-jdk-alpine
# Set base image as openjdk:8-jdk-alpine.
ARG JAR_FILE=target/*.jar
# Define JAR_FILE argument to match JAR file(s) in 'target' directory.
COPY ${JAR_FILE} app.jar
# Copy specified JAR file(s) to 'app.jar' in container.
ENV SPRING_PROFILES_ACTIVE=h2
# Set environment variable SPRING_PROFILES_ACTIVE to 'h2'.
ENV JAVA_OPTS="-Xmx256m -Xms128m"
# Set JAVA_OPTS environment variable with memory settings.
ENTRYPOINT ["java","-jar","app.jar"]
# Set command to execute Java with 'app.jar'.
EXPOSE 8090
# Document that container listens on port 8090.
