# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application JAR file into the container at the specified working directory
COPY target/SpringBootDemoApplication.jar /app/SpringBootDemoApplication.jar

# Expose the port that the application will run on
EXPOSE 8090

# Specify the command to run the application
CMD ["java", "-jar", "SpringBootDemoApplication.jar"]
