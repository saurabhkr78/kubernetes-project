# Use the official Ubuntu base image
FROM ubuntu:latest

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk apache2 unzip wget && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory for the web server
WORKDIR /var/www/html/

# Download and unzip the website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
RUN unzip -q photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose port 80 for the web server
EXPOSE 80

# Start the Apache HTTP server in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
