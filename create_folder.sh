#!/bin/bash

set -euo pipefail

folders=("base" "db_servers" "file_servers" "web_servers" "workstations")

for folder in "${folders[@]}"
do
	echo "$folder"
	mkdir -p roles/"$folder"/tasks
	touch roles/"$folder"/tasks/main.yaml
done
