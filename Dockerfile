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

CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                     PORTS      NAMES
abc123         nginx     "/docker-entrypoint.…"   3 minutes ago   Exited (0) 1 minute ago               container1
def456         nginx     "/docker-entrypoint.…"   3 minutes ago   Exited (0) 1 minute ago               container2
ghi789         nginx     "/docker-entrypoint.…"   3 minutes ago   Up 3 minutes               80/tcp     container3

