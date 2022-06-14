FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive 

# # Install packages
# RUN apt update && apt install -y zsh

# RUN apt install -y neofetch git curl wget dnsutils sudo python3

# # Azure CLI 
# RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

#RUN apt install -y 

# />

# Create & Set user
RUN adduser luke && adduser luke sudo
#RUN echo "luke ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/luke
USER luke


WORKDIR /home/luke
COPY config/* .
ENTRYPOINT [ "/bin/zsh" ]
