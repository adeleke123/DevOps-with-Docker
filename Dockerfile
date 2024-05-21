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
This command allows you to run commands inside an existing container.

docker exec -it web-service /bin/bash

# Follow the Logs: Once inside the container, use the tail command to follow the logs and see the secret message. 
The -f option will continuously output new lines added to the file.

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



