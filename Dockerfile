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

# Verify cleanup
docker ps -a

# output
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

docker image ls
# output
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

