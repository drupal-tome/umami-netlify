# Drupal's Umami demo with Tome & Netlify!

This project uses the Drupal [Tome] module with the Umami theme to demonstrate
how Tome projects can run on Netlify.

To view the latest build of the repository, visit https://umami.netlify.com

## Usage

To install, run:

```
composer install
./vendor/bin/drush tome:install
```

To start a local webserver, run:

```
./vendor/bin/drush run-server
```

To test the static build, run:

```
./vendor/bin/drush tome-static --run-server
```

### Netlify integration

The `netlify.toml` file contains the information necessary to run the build.
You should be able to fork or copy this project and use it with Netlify with no
extra configuration.

[Tome]: https://www.drupal.org/project/tome
