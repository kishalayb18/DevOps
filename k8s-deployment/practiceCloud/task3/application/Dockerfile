FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]

# # Use an official Ubuntu base image
# FROM ubuntu:latest

# # Install Node.js and npm
# RUN apt-get update && \
#     apt-get install -y nodejs npm && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# # Set the working directory in the container
# WORKDIR /usr/src/app

# # Copy package.json and package-lock.json (if present) to the working directory
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of the application code into the container
# COPY . .

# # Expose the port the app runs on
# EXPOSE 3000

# # Define the command to run the application
# CMD ["node", "app.js"]
