#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

export SERVER1_IP=$(terraform output --json | jq -r '.server1_public_ip | .value')

ssh-keygen -R ${SERVER1_IP} > /dev/null 2>&1
ssh-keyscan -H ${SERVER1_IP} >> ~/.ssh/known_hosts 2>/dev/null

ssh ubuntu@${SERVER1_IP} 'sudo bash -s' < _install_basic_server_configuration.sh

if ssh ubuntu@${SERVER1_IP} '[ -f /var/run/reboot-required ]'; then
    ssh ubuntu@${SERVER1_IP} 'sudo reboot'

    while ! ssh -q -o ConnectTimeout=5 -o BatchMode=yes ubuntu@${SERVER1_IP} exit; do
      echo "Wait SSH ready..."
      sleep 5
    done
    echo "SSH is ready, server is up!"
fi
