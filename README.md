### SonarQube local scan


#### prerequisites
* docker: https://docs.docker.com/engine/install/ubuntu/


#### How to run SonarQube locally
```bash

# run the SonarQube service, this script will run it port 9000
$ ./run_sonarqube.sh

# verify the container is running
$ docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED       STATUS       PORTS                                         NAMES
dd0401397c13   sonarqube:lts   "/opt/sonarqube/dock…"   2 hours ago   Up 2 hours   0.0.0.0:9000->9000/tcp, [::]:9000->9000/tcp   sonarqube

```

#### Go to the dashboard and create a token
* Go to: http://172.17.0.1:9000/
* Login with username: "admin", password: "admin"
* Set a new password
* Go to: http://172.17.0.1:9000/account/security
* Generate a token with Type: "User Token" and copy it to you clipboard


#### Create the .env and .properties files.
```bash

# create a .properties file, any file name is fine. 
# You don't need to change the contents, but you might want to change projectKey and projectName
$ cp sonar-project.properties.example sonar-project.properties

# create a .env file and set the variables. Here you will place your token and put absolute paths to your properties file and code directory.
$ cp sonarqube.env.example sonarqube.env

```


#### Start the scan

```bash
# launch the container if it's not running
$ ./run_sonarqube.sh

# run the SonarQube cli to initiate the scan. The URL for the results will be printed to the terminal
$ ./run_sonarqube_cli.sh
```

### view results
* get sonar.projectKey from your .properties file
* go to: http://172.17.0.1:9000/dashboard?id=<sonar.projectKey>   

