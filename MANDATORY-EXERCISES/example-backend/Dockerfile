# Use the official Golang image to build the app
FROM golang:1.16 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files
COPY go.mod go.sum ./

# Download the dependencies
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the application
RUN go build -o server

# Use a minimal base image to run the application
FROM debian:bullseye-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built binary from the build stage
COPY --from=build /app/server .

# Expose the port on which the app will run
EXPOSE 8080

# Define environment variable for PORT
ENV PORT=8080

# Command to run the application
CMD ["./server"]

