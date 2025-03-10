# Use an official Maven image to build the project
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml file and download project dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and build the project
COPY src ./src
RUN mvn clean package

# Use an official OpenJDK runtime as the base image
FROM openjdk:11-jre-slim

# Copy the built application from the previous stage
COPY --from=build /app/target/your-app.jar /app/your-app.jar

# Define the command to run the application
CMD ["java", "-jar", "/app/your-app.jar"]
