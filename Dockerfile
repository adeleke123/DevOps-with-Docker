EXERCISE 1.1: GETTING STARTED
---------------------------------

# Start 3 detached Containers:

docker run -d --name container1 ngnix
docker run -d --name container2 nginx
docker run -d --name container3 nginx

# Stop Two Containers:

docker stop container1
docker stop container2

# List all containers:

docker ps -a

# output

CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                      PORTS     NAMES
90f0286f4527   nginx     "/docker-entrypoint.…"   5 minutes ago   Up 5 minutes                80/tcp    container3
0315ad245c34   nginx     "/docker-entrypoint.…"   5 minutes ago   Exited (0) 13 seconds ago             container2
0fb7eaf58d7c   nginx     "/docker-entrypoint.…"   8 minutes ago   Exited (0) 16 seconds ago             container1

EXERCISE 1.2: CLEANUP
------------------------------
# Verify existing containers and images
docker ps -a
docker image ls

# Remove all containers
docker rm -f container1 container2 container3

# Remove all images
docker image rm e784f4560448 -f

# Verify containers cleanup
docker ps -a

# output
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

# Verify image cleanup
docker image ls

# output
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE


EXERCISE 1.3: SECRET MESSAGE
-------------------------------------
# Pull the Image:
docker pull devopsdockeruh/simple-web-service:ubuntu

# Run the Container: Start a container from this image in detached mode, so it runs in the background.
docker run -d --name web-service devopsdockeruh/simple-web-service:ubuntu

# Access the Running Container: Use docker exec to get inside the running container. 
# This command allows you to run commands inside an existing container.
docker exec -it web-service /bin/bash

# Follow the Logs: Once inside the container, use the tail command to follow the logs and see the secret message. 
# The -f option will continuously output new lines added to the file.
tail -f ./text.log

# Expected Output:
root@c6188c1f6de8:/usr/src/app# tail -f ./text.log
2024-05-21 12:18:05 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2024-05-21 12:18:07 +0000 UTC
2024-05-21 12:18:09 +0000 UTC
2024-05-21 12:18:11 +0000 UTC
2024-05-21 12:18:13 +0000 UTC
2024-05-21 12:18:15 +0000 UTC

EXERCISE 1.4: MISSING DEPENDENCIES
-----------------------------------

# Start the container:
docker run -it ubuntu sh -c "while true; do echo 'Input website:'; read website; echo 'Searching..'; sleep 1; curl http://\$website; done"

# Find the container ID:
docker ps

# Access the running container: in another terminal
docker exec -it <container_id> /bin/bash

# Install curl inside the container:
apt-get update
apt-get install -y curl

# Return to the original terminal and test the application by entering helsinki.fi when prompted:

Input website:
helsinki.fi
Searching..


EXERCISE 1.5: SIZES OF IMAGES
---------------------------------

# Step 1: Pull Both Images
# First, pull the Ubuntu-based and Alpine-based images of devopsdockeruh/simple-web-service.

docker pull devopsdockeruh/simple-web-service:ubuntu
docker pull devopsdockeruh/simple-web-service:alpine

# Step 2: Compare the Image Sizes
# List all Docker images to compare their sizes:

docker image ls

# output
REPOSITORY                          TAG       IMAGE ID       CREATED       SIZE
ubuntu                              latest    bf3dc08bfed0   3 weeks ago   76.2MB
ubuntu                              22.04     52882761a72a   3 weeks ago   77.9MB
devopsdockeruh/simple-web-service   ubuntu    4e3362e907d5   3 years ago   83MB
devopsdockeruh/simple-web-service   alpine    fd312adc88e0   3 years ago   15.7MB

# Step 3: Verify Functionality in the Alpine Container
# Start the Alpine-based container:
docker run -d --name alpine-web-service devopsdockeruh/simple-web-service:alpine

# Access the running container:
docker exec -it alpine-web-service sh

# Verify the secret message functionality:

/usr/src/app # tail -f /usr/src/app/text.log
2024-05-21 15:41:27 +0000 UTC
2024-05-21 15:41:29 +0000 UTC
2024-05-21 15:41:31 +0000 UTC
2024-05-21 15:41:33 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2024-05-21 15:41:35 +0000 UTC
2024-05-21 15:41:37 +0000 UTC
2024-05-21 15:41:39 +0000 UTC
2024-05-21 15:41:41 +0000 UTC
2024-05-21 15:41:43 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'

EXERCISE 1.6: HELLO DOCKER HUB
-----------------------------------




