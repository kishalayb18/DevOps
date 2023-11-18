# Use an official OpenJDK runtime as a parent image
FROM openjdk:11

# Set the working directory to /app (this directory will create inside the docker container)
WORKDIR /app

# Copy the current directory contents into the container at /app directory
COPY . /app  
#COPY HelloWorld.java /app > this will work as there is single file

# Compile the Java source code
RUN javac HelloKishalay.java

# Run the application
CMD ["java", "HelloKishalay"]
