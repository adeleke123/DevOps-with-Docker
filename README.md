# DevOps-with-Docker

**EXERCISE 1.1: GETTING STARTED**

- Since we already did `"Hello, World!"` in the material let's do something else.

- Start 3 containers from an image that does not automatically exit (such as nginx) in detached mode.

- Stop two of the containers and leave one container running.

- Submit the output for `docker ps -a` which shows 2 stopped containers and one running.

**EXERCISE 1.2: CLEANUP**

- We have containers and an image that are no longer in use and are taking up space. 

- Running `docker ps -a` and `docker image ls` will confirm this.

- Clean the Docker daemon by removing all images and containers.

- Submit the output for `docker ps -a` and `docker image ls`

**EXERCISE 1.3: SECRET MESSAGE**

- Now that we've warmed up it's time to get inside a container while it's running!
- Image `devopsdockeruh/simple-web-service:ubuntu` will start a container that outputs logs into a file.
- Go inside the running container and use `tail -f ./text.log` to follow the logs.
- Every 10 seconds the clock will send you a `secret message`.
- Submit the secret message and command(s) given as your answer.
