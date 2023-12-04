#!/usr/bin/env bash
# set -x
#
# This script will get a SAML token from a file and set it via AWS CLI
#
####################################################################################################

if [ -f ~/Downloads/credentials.txt ]; then
    echo "Credentials file found. Setting AWS CLI credentials for --profile saml."
    # Add a trailing newline to the file to allow the last line to be read
    echo "" >> ~/Downloads/credentials.txt
    while IFS= read -r line; do
        if [[ $line == *"aws_access_key_id"* ]]; then
            key=$(echo $line | cut -d'=' -f2)
            aws configure set aws_access_key_id $key --profile saml
        elif [[ $line == *"aws_secret_access_key"* ]]; then
            value=$(echo $line | cut -d'=' -f2)
            aws configure set aws_secret_access_key $value --profile saml
        elif [[ $line == *"aws_session_token"* ]]; then
            token=$(echo $line | cut -d'=' -f2)
            aws configure set aws_session_token $token --profile saml
        fi
    done < ~/Downloads/credentials.txt    
    aws sts get-caller-identity --profile saml
else
    echo "Credential file not found."
fi
