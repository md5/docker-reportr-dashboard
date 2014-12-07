# mdillon/reportr-dashboard

A [Docker](https://docker.com) container running [Reportr](http://www.reportr.io/).

## Usage

Run a web container using linked Redis and Mongo containers:

    docker run -d -p 5000:5000 \
        --link some-redis:redis \
        --link some-mongo:mongo \
        --name reportr-web \
        mdillon/reportr-dashboard

Your dashboard can be accessed at http://localhost:5000/ (or http://`$DOCKER_HOST`:5000 for [boot2docker](http://boot2docker.io/)).

Or use [nginx-proxy](https://github.com/jwilder/nginx-proxy) and configure
possibly external Redis and Mongo servers:

    docker run -d \
        -e VIRTUAL_HOST=dashboard.example.com \
        -e REDIS_URL=redis://redis.example.com:6379 \
        -e MONGODB_URL=mongodb://mongo.example.com:27017/my-reportr-db \
        --name reportr-web \
        mdillon/reportr-dashboard

Then run a worker container, using the same links or environment variables to
configure your Redis and Mongo:

    docker run -d \
        --link some-redis:redis \
        # -e REDIS_URL=redis://redis.example.com:6379 \
        --link some-mongo:mongo \
        # -e MONGODB_URL=mongodb://mongo.example.com:27017/my-reportr-db \
        --name reportr-worker \
        mdillon/reportr-dashboard \
        node bin/worker.js

The default database name is `reportr`. If Docker links are being used, the
database name can be changed by specifying the `REPORTR_DB_NAME` environment
variable. Otherwise, the database name should e set directly as part of the
`MONGODB_URL` environment variable.
