# EXERCISE 1.7: IMAGE FOR SCRIPT
# Start with the base image
FROM ubuntu:22.04

# Update the package list and install curl
RUN apt-get update && apt-get install -y curl

# Copy the script.sh file into the Docker image
COPY script.sh /usr/local/bin/script.sh

# Give execute permissions to the script
RUN chmod a+x /usr/local/bin/script.sh

# Set the script to run when the container starts
CMD ["/usr/local/bin/script.sh"]


# EXERCISE 1.11: SPRING
# Use Amazon Corretto 8 as the base image
FROM amazoncorretto:8

# Set the working directory
WORKDIR /app

# Copy the Maven wrapper and Maven configuration files
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Install Maven dependencies
RUN ./mvnw dependency:go-offline

# Copy the project source code
COPY src ./src

# Build the project
RUN ./mvnw package

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]

# MANDATORY EXERCISE 1.12: HELLO, FRONTEND!
# Use the Node.js 16 LTS image
FROM node:16

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the project
RUN npm run build

# Install serve to serve the build files
RUN npm install -g serve

# Expose the application port
EXPOSE 5000

# Serve the build files
CMD ["serve", "-s", "build", "-l", "5000"]


