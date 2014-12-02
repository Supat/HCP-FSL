#!/bin/bash

# default parameter initialization
FSLDIR=/usr/local/fsl			# FSL directory default path
DATADIR=.						# dataset directory path
FSFPATH=./design.fsf				# design.fsf file path
OUTNAME=out						# output directory name
TMPDIR=./temp					# temporary directory path
DDIRLV=2							# default HCP formatted directory initial depth level

usage() {
	echo "Description: "
	echo "	This script automate 3rd-level analysis of HCP using FSL."
	echo "This script is compatible with HCP format directory structure only."
	echo "Usage: "
	echo "	./level3_feat_analysys.sh -[fdlo value]"
}

# check program input parameter
while [ "$1" != "" ]; do
	case $1 in
		-f | --fsldir)		shift			# shift to next parameter to retrive input value
							FSLDIR=$1		# change FSL directory path to input value
							;;				# case terminator
		-d | --datadir)		shift			
							DATADIR=$1		# change dataset's directory path to input value
							;;
		-s | --designpath)	shift
							FSFPATH=$1		# change design.fsf path to input value
							;;
		-l | --dirlevel)		shift
							DDIRLV=$1		# change HCP formatted directory initial depth
							;;
		-o | --output)		shift
							OUTNAME=$1		# change output directory name to input value
							;;
		-h | --help)			usage			# display help message
							exit 0
							;;
		*)					;; 				# unknown option
	esac
	shift # shift to next parameter
done

# variable parameter initialization
FSLBIN=${FSLDIR}/bin				# FSL's binary directory
OUTDIR=./${OUTNAME}.gfeat		# output directory path

# create analysis essential directory
mkdir $OUTDIR					# create output directory
mkdir $TMPDIR					# create temporary directory

# main program goes here ...
cp $FSFPATH ${TMPDIR}/design.fsf
feat_model ${TMPDIR}/design

# clean up temporary directory from the system
rm -r $TMPDIR
