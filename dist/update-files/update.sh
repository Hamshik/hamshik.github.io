#!/bin/bash
# update-repo.sh
set -e

# Path to the repository root
REPO_DIR="/home/hamshik/Hamshik.github.io/dist"
DIST_DIR="$REPO_DIR/dists/bookworm"
POOL_DIR="$REPO_DIR/pool"

# Generate the Release file using your custom apt-ftparchive configuration.
# Make sure the configuration file exists and is updated.
apt-ftparchive -c "$REPO_DIR/config/apt-ftparchive.conf" release "$DIST_DIR" > "$DIST_DIR/Release"

# Verify that the Release file exists
if [ ! -f "$DIST_DIR/Release" ]; then
    echo "Release file not found at $DIST_DIR/Release"
    exit 1
fi

# Sign the Release file to create Release.gpg.
# Replace YOUR-KEY-ID with your actual GPG key ID, or omit --default-key if using the default.
gpg --default-key 6C7E1E27C88F34071768352E6F2EBAFD44F7DA89 \
    --output "$DIST_DIR/Release.gpg" \
    --detach-sign "$DIST_DIR/Release"

echo "Repository updated and signed."


