FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive 

### ---------------
### Package install
### ---------------
RUN apt update

## Misc
RUN apt install -y sudo zsh neofetch unzip

## Development
RUN apt install -y vim git

## Networking
RUN apt install -y curl wget dnsutils

## Languages
RUN apt install -y golang-go python3

### ---------------
### Initialization
### ---------------

# Set timezone
ARG TIMEZONE=America/Vancouver
RUN apt install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Create & Set user
RUN adduser luke && adduser luke sudo
RUN echo "luke ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/luke

# External Volume
RUN mkdir /data && chown -R luke /data
VOLUME [ "/data" ]

# Setup histfile persistence
ARG HISTFILE=/data/ubuntu-histfile
RUN touch $HISTFILE && ln -s $HISTFILE /home/luke/.histfile

USER luke
WORKDIR /home/luke
COPY config/* .
ENTRYPOINT [ "/bin/zsh" ]
