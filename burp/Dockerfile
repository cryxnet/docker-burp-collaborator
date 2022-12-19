# Using Ubuntu as Docker Image
FROM ubuntu:latest

# Identify the maintainer of an image
LABEL maintainer="cryxnet"

# Copy burp folder to /opt/
COPY burp/ /opt/

# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y

# Install Java
RUN apt install default-jre

# Apt Cleanup
RUN apt-get autoremove && apt-get clean && /bin/rm -rf /var/lib/apt/lists/*

# Creating new group && new user && adding permission 
RUN groupadd -r burpsuite && useradd -r -g burpsuite collaborator && chown -R collaborator /opt/burp/

# Set WORKDIR
WORKDIR /opt/burp/

# Set USER
USER collaborator

# Dock Entrypoint
ENTRYPOINT ["/opt/burp/scripts/entrypoint.sh"]