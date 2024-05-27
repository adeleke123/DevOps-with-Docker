# Use the official Node.js image to build the app
FROM node:16 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the source code into the container
COPY . .

# Set backend URL environment variable using build argument
ENV REACT_APP_BACKEND_URL=http://localhost:8080

# Build the application
RUN npm run build

# Use a minimal base image to serve the app
FROM nginx:alpine

# Copy the build output to the Nginx HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port on which the app will run
EXPOSE 80

# Command to run the application
CMD ["nginx", "-g", "daemon off;"]
