#!/bin/bash

# extracts seaonal data 

inputf=$1
vars=$2
seasons=(djf mam jja son)

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

inputf=$1

if [ ! -e $inputf ]
then
        echo "$inputf not found"
        exit
fi

for season in "${seasons[@]}"
do
	echo "$season $var"
	cdo yearmean -select,season=$season $inputf ${season}_${inputf}
done
