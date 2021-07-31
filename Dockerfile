FROM ubuntu:latest

ARG GITHUB_ACTOR="surfnet-niels"
ARG GITHUB_TOKEN=""
ARG GITHUB_REPOSITORY="surfnet-niels/simplesamlphp.github.io"

COPY docs/build-docs.sh /tmp/build-docs.sh

RUN apt update
RUN DEBIAN_FRONTEND="noninteractive" apt -y install tzdata

#RUN mkdir /tmp/inacademia/admin
RUN /tmp/build-docs.sh

ENTRYPOINT ["/bin/bash"]
