#MultiStage docker file.

#Stage 1: Build

FROM maven:3.8.3-jdk-11-slim AS build

WORKDIR /build

COPY ./myapp/pom.xml ./myapp/pom.xml
COPY ./myapp/src ./myapp/src

RUN mvn -f ./myapp/pom.xml clean package -DskipTests

#Stage 2: Run

FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build /build/myapp/target/*.jar app.jar

RUN --mount=type=secret, id=APPUSER_PASSWORD \
    useradd --create-home --shell /bin/bash appuser && \
    echo "appuser:$(cat /run/secrets/APPUSER_PASSWORD)" | chpasswd && \
    chown appuser:appuser app.jar

USER appuser

ENTRYPOINT ["java", "-jar", "app.jar"]

