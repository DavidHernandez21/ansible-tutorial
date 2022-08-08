#!/bin/bash

set -euo pipefail


for fol in $(ls)
do
	if [ -d "$fol" ]
	then

		echo "$fol"
		mkdir -p $(pwd)/"$fol"/vars
		touch $(pwd)/"$fol"/vars/main.yaml
	fi
done
