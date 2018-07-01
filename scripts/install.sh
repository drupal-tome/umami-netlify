#!/usr/bin/env bash

drush site-install demo_umami -y
drush en tome -y
drush tome:import -y
drush cr
drush uli
