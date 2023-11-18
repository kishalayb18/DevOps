# Use an official OpenJDK runtime as a parent image
FROM openjdk:11

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Compile the Java source code
RUN javac HelloWorld.java

# Run the application
CMD ["java", "HelloWorld"]
