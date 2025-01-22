# Use the official Nginx image as the base image
FROM nginx:latest

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration


COPY nginx.conf /etc/nginx/conf.d/

# Copy the HTML file into the Nginx default web root directory
COPY index.html /usr/share/nginx/html/
COPY images /usr/share/nginx/html/images

# Expose port 80 for incoming traffic
EXPOSE 80
