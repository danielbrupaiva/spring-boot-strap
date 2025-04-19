# Stage 1: Build the application
FROM eclipse-temurin:21-jdk-alpine AS build
# Install bash (Alpine doesn't include it by default)
RUN apk add --no-cache bash
# Download and install Gradle
# Set Gradle version
ENV GRADLE_VERSION=8.10
# Install bash, curl, unzip, and tar
RUN apk add --no-cache bash curl unzip tar
RUN curl -sSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    -o gradle.zip && \
    unzip gradle.zip -d /opt && \
    ln -s /opt/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle && \
    rm gradle.zip
# Set the working directory
WORKDIR /workspace
COPY . .
# Make sure the script is executable
RUN chmod +x entrypoint.sh
# Set the script as the entrypoint
ENTRYPOINT ["./entrypoint.sh"]