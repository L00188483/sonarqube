#!/bin/bash

ENV_FILENAME="sonarqube.env"

# check .env file exists
if [ ! -f $ENV_FILENAME ]; then
    echo "$ENV_FILENAME file not found"
    exit 1
fi

# fetch environment variables from .env
export $(grep -v '^#' $ENV_FILENAME | xargs)

echo -e "\nLooking for environment variables in sonarqube.env: \n"
echo "SONAR_TOKEN: $SONAR_TOKEN"
echo "PROJECT_DIRECTORY: $PROJECT_DIRECTORY"
echo "PROPERTIES_FILEPATH: $PROPERTIES_FILEPATH"



docker run --rm \
  -e SONAR_HOST_URL="http://172.17.0.1:9000" \
  -e "SONAR_TOKEN=$SONAR_TOKEN" \
  -v "$PROJECT_DIRECTORY:/usr/src/app" \
  -v "$PROPERTIES_FILEPATH:/usr/src/config/sonar-project.properties" \
  -w /usr/src/app \
  sonarsource/sonar-scanner-cli \
  -X -Dproject.settings=/usr/src/config/sonar-project.properties

#-Dsonar.token=$TOKEN
