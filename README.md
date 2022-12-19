# Burp Collaborator Docker Container (extra: Azure Deployment)

Docker Image for the Burp Collaborator Server and deployment to Azure.

**Warning:** New Project; Testing is still needed

## Requirements

- Docker
- Burp Suite Professional
- Azure Account and Credits

## Setup Burpuite Environment

1. Clone the repository to your server (Ubuntu/Debian)
2. Install the BurpSuite Pro (**JAR** File)
3. Put the Burp Suite **JAR** file in `./burp/pgk/` (Name should be `burp.jar`)
4. Configure the file `./burp/configuration/burp.config` to your liking

## Initialize/Run Docker Container

1. Run the `./init.sh` file to initialize and starting the container (First time using it on the server)

### Troubleshooting

- After to initialize the enviroment etc. dont use this script (`./init.sh`) to start the BurpSuite Collborator container
- Use the shell script located in `./burp/run.sh` or just run the command `docker run BurpsuiteCollaborator`.

## Setup Azure Environment

## Deploy on Azure

![Deploy tp Azure](https://portal.azure.com/#create/Microsoft.Template/uri/)
