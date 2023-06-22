#!/bin/bash

JENKINS_URL="<Jenkins_job_URL>"
JENKINS_USER="<Jenkins_username>"
JENKINS_TOKEN="<jenkins_token>"

curl -X POST -u "$JENKINS_USER:$JENKINS_TOKEN" "$JENKINS_URL"
