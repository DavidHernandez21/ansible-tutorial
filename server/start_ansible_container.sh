#!/bin/bash

set -euo pipefail

tag=$1

docker run --rm -itd --name debian-ansible -p 2200:22 debian-ansible:"$tag"
