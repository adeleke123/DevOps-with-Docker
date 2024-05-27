# Use the official golang image to build the app
FROM golang:1.16 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app with static linking
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server .

# Use a minimal base image to run the app
FROM alpine:latest

# Set environment variables
ENV PORT=8080

# Install ca-certificates
RUN apk --no-cache add ca-certificates

# Copy the binary from the build stage
COPY --from=build /app/server /server

# Expose the port on which the app will run
EXPOSE 8080

# Command to run the application
CMD ["./server"]

