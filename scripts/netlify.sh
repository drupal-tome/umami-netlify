#!/usr/bin/env bash

composer install
composer install-tome
drush tome:static -l https://umami.netlify.com/
