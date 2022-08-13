#!/bin/bash

set -euo pipefail

filename="$1"

user_name_value=$(docker run --rm -v "${PWD}":/workdir mikefarah/yq '.user_name' "$filename")
user_present=$(docker run --rm -v "${PWD}":/workdir mikefarah/yq '.user_name as $user | .ssh_allow_users | contains($user)' "$filename")

if [ "$user_present" != true ]
then
    echo "User from key 'user_name' not found in key 'ssh_allow_users'...adding it"
    docker run --rm -v "${PWD}":/workdir mikefarah/yq '.user_name as $user | .ssh_allow_users = "test " + $user' "$filename"
else
    echo "User from key 'user_name' ($user_name_value) found in key 'ssh_allow_users'...not adding it again"
fi



