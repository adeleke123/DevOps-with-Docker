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

