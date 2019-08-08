FROM debian:buster-slim
LABEL maintainer="AAMServices <info@aamservices.uk>"

RUN apt-get update && \
    apt-get -y install rdiff-backup openssh-client
