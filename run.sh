#!/bun/bash
set -x
mkdir -p /workdir
export RUNNER_ALLOW_RUNASROOT=1
./config.sh --url https://github.com/Visyond/visyond\
    --token ${TOKEN}\
    --name visyond-linux-runner\
    --work /workdir
./run.sh
