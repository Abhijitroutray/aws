#!/bin/bash
# This script will install the AWS CLI
# Requires Python, PIP

read -rp "Install and Configure AWS CLI? (y/n) " INSTALL
if [[ $INSTALL =~ ^([yY][eE][sS]|[yY])$ ]]; then

	# Test if PIP is installed
	command -v pip >/dev/null 2>&1 || {
		brew install python
	}

	# Test if AWS CLI is installed
	command -v aws >/dev/null 2>&1 || {
		pip install awscli

		aws configure
		complete -C '/usr/local/aws/bin/aws_completer' aws
	}
	echo "Completed."
fi
