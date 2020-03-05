#!/bin/bash -e
set -x
mkdir -p /workdir
export RUNNER_ALLOW_RUNASROOT=1
cd /actions-runner
echo "Configuring it..."
./config.sh --url https://github.com/Visyond/visyond \
    --token ${TOKEN} \
    --name visyond-linux-runner-`hostname` \
    --work /workdir
echo "Running it..."
./run.sh
