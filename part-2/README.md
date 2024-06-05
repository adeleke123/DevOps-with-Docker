**EXERCISE 2.1**

- Let us now leverage the Docker Compose with
- the simple webservice that we used in the [Exercise 1.3](https://devopswithdocker.com/part-1/section-2#exercise-13)
- Without a command `devopsdockeruh/simple-web-service`
- will create logs into its `/usr/src/app/text.log.`
- Create a docker-compose.yml file that starts `devopsdockeruh/simple-web-service` and
- saves the logs into your filesystem.
- Submit the docker-compose.yml, and
- make sure that it works simply by running `docker compose up` if the log file exists.

**EXERCISE 2.2**

- Read about how to add the command to `docker-compose.yml`
- from the [documentation](https://docs.docker.com/compose/compose-file/compose-file-v3/#command).
- The familiar image `devopsdockeruh/simple-web-service`
- can be used to start a web service, see the `exercise 1.10`.
- Create a docker-compose.yml, and
- use it to start the service so that you can use it with your browser.
- Submit the `docker-compose.yml`, and
- make sure that it works simply by running docker compose up

**MANDATORY EXERCISE 2.3**

- As we saw previously, starting an application with two programs was not trivial and
- the commands got a bit long.
- In the [previous part](https://devopswithdocker.com/part-1/section-6)
- we created Dockerfiles for both
- [frontend](https://github.com/docker-hy/material-applications/tree/main/example-frontend) and
- [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend) of the example application.
- Next,simplify the usage into one `docker-compose.yml`.
- Configure the backend and frontend from [part 1](https://devopswithdocker.com/part-1/section-6#exercises-111-114) to work in Docker Compose.
- Submit the docker-compose.yml

**EXERCISE 2.4**

- In this exercise you should expand the configuration done in **Exercise 2.3** and
- set up the example backend to use the key-value database [Redis](https://redis.com/).
- Redis is quite often used as a [cache](https://en.wikipedia.org/wiki/Cache_(computing))
- to store data so that future requests for data can be served faster.
- The backend uses a slow API to fetch some information.
- You can test the slow API by requesting `/ping?redis=true` with curl.
- The frontend app has a button to test this.
- So you should improve the performance of the app and
- configure a Redis container to cache information for the backend.
- The [documentation](https://hub.docker.com/_/redis/) of the Redis image might contain some useful info.
- The backend [README](https://github.com/docker-hy/material-applications/tree/main/example-backend) should have all the information that is needed for configuring the backend.
- When you've correctly configured the button will turn green.
- Submit the `docker-compose.yml`




![image](https://github.com/adeleke123/DevOps-with-Docker/assets/51156057/232fac3e-aa5c-4c90-831b-bcbce6644b43)



- [The restart: unless-stopped configuration can help if the Redis takes a while to get ready.](https://docs.docker.com/compose/compose-file/compose-file-v3/#restart)

**EXERCISE 2.5**
- The project [https://github.com/docker-hy/material-applications/tree/main/scaling-exercise](https://github.com/docker-hy/material-applications/tree/main/scaling-exercise)
- is a barely working application. Go ahead and clone it for yourself.
- The project already includes `docker-compose.yml` so you can start it by running `docker compose up`.
- The application should be accessible through [http://localhost:3000](http://localhost:3000/).
- However it doesn't work well enough and we've added a load balancer for scaling.
- Your task is to scale the `compute` containers so that the button in the application turns green.
- This exercise was created with [Sasu Mäkinen](https://github.com/sasumaki)
- Please return the used commands for this exercise.
