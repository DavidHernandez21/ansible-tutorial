#!/bin/bash

set -euo pipefail

tag=$1

docker run --rm -itd --name bullseye-ansible -p 2200:22 bullseye-ansible:"$tag"
