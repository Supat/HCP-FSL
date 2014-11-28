#!/bin/bash

usage() {
	echo "Description: "
	echo "	This script automate 3rd-level analysis of HCP using FSL."
	echo "Usage: "
	echo "	./level3_feat_analysys.sh"
}

# check whether user had supplied -h or --help . If yes display usage 
if [[ ( $1 == "--help") ||  $1 == "-h" ]] 
then 
	usage
	exit 0
fi 
