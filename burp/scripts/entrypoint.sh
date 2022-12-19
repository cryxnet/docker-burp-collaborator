#!/bin/bash
cd /opt/burp
exec java -jar /opt/burp/pkg/burp.jar --collaborator-server --collaborator-config=/opt/burp/configuration/burp.config | tee burpcollaborator.logs