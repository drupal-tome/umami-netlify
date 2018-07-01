mkdir -p web/themes
mkdir -p web/modules
mkdir -p web/sites
mkdir -p web/sites/default
if [ ! -L web/sites/default/settings.php ] && [ ! -e web/sites/default/settings.php ]; then
    ln -s ../../../settings.php web/sites/default/settings.php
fi
if [ ! -L web/themes/custom ] && [ ! -e web/themes/custom ]; then
    ln -s ../../themes web/themes/custom
fi
if [ ! -L web/modules/custom ] && [ ! -e web/modules/custom ]; then
    ln -s ../../modules web/modules/custom
fi
