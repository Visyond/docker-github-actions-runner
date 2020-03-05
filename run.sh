#!/bin/bash
set -x
mkdir -p /workdir
export RUNNER_ALLOW_RUNASROOT=1
cd /actions-runner
echo "Configuring it..."
./config.sh --url https://github.com/Visyond/visyond \
    --unattended --replace \
    --token ${TOKEN} \
    --name visyond-linux-runner-`hostname` \
    --work /workdir
echo "Running it..."
while [ true ]; do
    ./run.sh
    echo "Stopped. Restarting in 1 minute"
    sleep 60
done
