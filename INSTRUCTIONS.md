# Introduction
This is a repository to make it easier for you to start a dockerized rails app.
It is based on a light weight alpine based Ruby image.
It uses a PostgreSQL for the database.
Also, it runs the webpack-dev-server, which makes your JS development faster.

# How to use
1. Clone this Repository

2. Copy this directory with a new name.
```
cp -r DockerTempaltesForRails/Alpine/PostgreSQL <App Name>
```

3. Initialize the application.
Initialize your app with the command below.

```
bash initialize_app.sh
```

The command above will initialize rails app, db, and webpacker.

4. If you want webpacker to be running, edit `docker-compose.yml` and `config/webpacker.yml`.

## How to configure `docker-compose.yml`
First take a note of the docker image name for the service `web`.
It should be something like `<appname>_web`.
Run the command below to get the docker image names.

```
docker images --format "{{.Repository}}"
```

Open your `docker-compose.yml` file and uncomment the `webpacker` rows.
Replace `<image_name_from_web>` with the docker image name you've noted.


## How to configure `config/webpacker.yml`

Change the host value from `localhost` to `webpacker`

```yaml
development:
  <<: *default
  dev_server:
    host: webpacker
```