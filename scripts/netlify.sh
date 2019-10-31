#!/bin/bash

set -e

composer install

mkdir -p "$NETLIFY_BUILD_BASE/cache"

# Load the last database backup if available.
if [ -f "$NETLIFY_BUILD_BASE/cache/.ht.sqlite" ]; then
    echo "Cache database found - running partial import"

    mkdir -p ./web/sites/default/files
    cp "$NETLIFY_BUILD_BASE/cache/.ht.sqlite" ./web/sites/default/files/.ht.sqlite
    ./vendor/bin/drush tome:import-partial -y

    # Load the last static build if available.
    if [ -f "$NETLIFY_BUILD_BASE/cache/html"; then
        echo "Cached static build found"
        cp -r "$NETLIFY_BUILD_BASE/cache/html" ./html
    fi
else
    echo "No cached build - running full install"
    ./vendor/bin/drush tome:install -y
fi

# Index search.
LUNR_DRUSH=./vendor/bin/drush node web/modules/contrib/lunr/js/index.node.js default

# Run the static build.
./vendor/bin/drush tome:static -l https://umami.netlify.com

# Export database backup.
cp ./web/sites/default/files/.ht.sqlite "$NETLIFY_BUILD_BASE/cache/.ht.sqlite"

# Export static build.
if [ -f "$NETLIFY_BUILD_BASE/cache/html" ]; then
    rm -rf "$NETLIFY_BUILD_BASE/cache/html"
fi

cp -r ./html "$NETLIFY_BUILD_BASE/cache/html"
