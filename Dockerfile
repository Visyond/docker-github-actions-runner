FROM debian:stable

RUN apt-get update \
  && apt-get install -y git docker.io curl gnupg \
  && mkdir /actions-runner && cd /actions-runner \
  && curl -O -L https://github.com/actions/runner/releases/download/v2.165.2/actions-runner-linux-x64-2.165.2.tar.gz \
  && tar xzf ./actions-runner-linux-x64-2.165.2.tar.gz \
  && /actions-runner/bin/installdependencies.sh

COPY run.sh /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT [ "/entrypoint" ]
