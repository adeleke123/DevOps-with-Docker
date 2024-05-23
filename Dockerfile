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
