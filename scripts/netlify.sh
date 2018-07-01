#!/usr/bin/env bash

composer install
composer install-tome
drush tome:static
