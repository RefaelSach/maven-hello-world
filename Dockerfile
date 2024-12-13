#MultiStage docker file.

#Stage 1: Build
#Using jdk for image to build the application, to ensure comptablitly
#with all the depnecencies
FROM maven:3.8.3-jdk-11-slim AS build

WORKDIR /build

COPY ./myapp/pom.xml ./myapp/pom.xml
COPY ./myapp/src ./myapp/src

RUN mvn -f ./myapp/pom.xml clean package -DskipTests

#Stage 2: Run
#Use jre which is a lightweight image to run the application
FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build /build/myapp/target/*.jar app.jar

#Instead of the previous --disable password, i used docker secret which usint password for more security.
RUN --mount=type=secret,id=APPUSER_PASSWORD \
    useradd --create-home --shell /bin/bash appuser && \
    PASSWORD=$(cat /run/secrets/APPUSER_PASSWORD) && \
    echo "appuser:${PASSWORD}" | chpasswd && \
    chown appuser:appuser app.jar

USER appuser

ENTRYPOINT ["java", "-jar", "app.jar"]

