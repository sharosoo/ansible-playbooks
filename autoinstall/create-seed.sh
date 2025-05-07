#!/usr/bin/env bash
# Builds seed.iso from user-data, meta-data, network-config

set -e
TMPDIR=$(mktemp -d)
cp user-data meta-data network-config "$TMPDIR/"
cloud-localds --network-config="$TMPDIR/network-config" seed.iso "$TMPDIR/user-data" "$TMPDIR/meta-data"
echo "Generated seed.iso in $(pwd)"

