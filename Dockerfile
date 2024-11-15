FROM openjdk:11-jre-slim

WORKDIR /app

COPY ./myapp/target/*.jar app.jar

RUN adduser --disabled-password --gecos "" appuser && chown appuser:appuser app.jar

USER appuser

ENTRYPOINT ["java", "-jar", "app.jar"]

