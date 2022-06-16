FROM browningluke/ubuntu:base

### ---------------
### Package install
### ---------------

# Azure CLI 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# AWS CLI

RUN 

RUN ([[ $TARGETARCH == "arm64" ]] \
        && curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \
        || curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"  -o "awscliv2.zip") \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm "awscliv2.zip"


# Kubectl
RUN sudo apt-get install -y apt-transport-https ca-certificates curl \
    && sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list \
    && sudo apt-get update \
    && sudo apt-get install -y kubectl


# Terraform
RUN sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl \
    && curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
    && sudo apt-add-repository "deb [arch=$TARGETARCH] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && sudo apt-get update && sudo apt-get install terraform

# Pulumi
RUN curl -fsSL https://get.pulumi.com | sh

### ---------------
### Initialization
### ---------------

# Handle config files
COPY .zshrc.append /home/luke/.zshrc.append
RUN cat /home/luke/.zshrc.append >> /home/luke/.zshrc && rm /home/luke/.zshrc.append
