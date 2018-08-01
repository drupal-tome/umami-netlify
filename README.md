# Drupal's Umami demo with Tome & Netlify!

This project uses the Drupal [Tome] module with the Umami theme to demonstrate
how Tome projects can run on Netlify.

To view the latest build of the repository, visit https://umami.netlify.com

## Usage

To create a new Tome project, run:

```
composer create-project drupal-tome/tome-project my_site --stability dev --no-interaction
```

To install Tome, run:

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

[Tome]: https://www.drupal.org/project/tome
