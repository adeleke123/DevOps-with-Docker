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
