FROM ubuntu:latest

ARG GITHUB_ACTOR="surfnet-niels"
ARG GITHUB_TOKEN="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"
ARG GITHUB_REPOSITORY="surfnet-niels/simplesamlphp.github.io"

COPY docs/build-docs.sh /tmp/build-docs.sh

RUN apt update
RUN DEBIAN_FRONTEND="noninteractive" apt -y install tzdata

#RUN mkdir /tmp/inacademia/admin
RUN /tmp/build-docs.sh

ENTRYPOINT ["/bin/bash"]
