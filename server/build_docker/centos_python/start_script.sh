#!/bin/bash

set -euo pipefail

/usr/sbin/sshd -D
exec /usr/sbin/init
