FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive 

# Install packages
RUN apt update && apt install -y zsh

RUN apt install -y neofetch git curl wget dnsutils sudo python3

RUN apt install -y vim

# Azure CLI 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

#RUN apt install -y 

# />


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
