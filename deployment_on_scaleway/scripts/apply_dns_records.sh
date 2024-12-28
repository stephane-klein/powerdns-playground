#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

export SERVER1_IP=$(terraform output --json | jq -r '.server1_public_ip | .value')

terraform -chdir=dns_records init
terraform -chdir=dns_records apply
