#!/usr/bin/env bash

composer install
composer run install-tome
drush tome:static
