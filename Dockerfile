# Stage 1: Build the application
FROM maven:3.8.1-openjdk-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM eclipse-temurin:17-jre-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the built jar file from the build stage
COPY --from=build /app/target/CarBooking.jar /app/app.jar

# Set the environment variable for the application name
ENV SPRING_APPLICATION_NAME=HSF301_Assignment_Spring_MVC

# Expose the port the application runs on
EXPOSE 8083

# Run the application
CMD ["java", "-jar", "/app/app.jar"]
