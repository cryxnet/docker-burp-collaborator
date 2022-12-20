# Burp Collaborator Docker Container

Docker Image for the Burp Collaborator Server and deployment to Azure.

**Warning:** New Project; Testing is still needed

## Requirements

- Docker
- Azure Account and Credits (For Azure Deployment)

## Setup Burpsuite Environment

1. Fork this repository and clone it
2. Configure the file `./burp/configuration/burp.config` to your liking
3. Push all changes to your repository

## Deployment

### Virtual Machine / Computer etc.

1. Install git and docker to your machine
2. Clone your repository to your machine
3. Build the Docker image using `docker build -t burpsuitecollabertor`
4. Start Docker with this image using `docker run --name burpsuitecollabertor`

### Azure Container Instance

Coming soon...
