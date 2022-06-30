#!/bin/bash
set -e

mkdir -p ~/.ssh
chmod -R 0700 ~/.ssh
cp -ip /run/secrets/my_aws_id_rsa ~/.ssh/aws_id_rsa
cp -ip /run/secrets/my_config ~/.ssh/config
chmod -R 0600 ~/.ssh

exec "$@"
