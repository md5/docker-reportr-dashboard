# mdillon/reportr-dashboard

A [Docker](https://docker.com) container running [Reportr](http://www.reportr.io/).

## Usage

Run a web container using linked Redis and Mongo containers:

    docker run -d -p 80:5000 \
        --link some-redis:redis \
        --link some-mongo:mongo \
        mdillon/reportr-dashboard

Or use [nginx-proxy](https://github.com/jwilder/nginx-proxy) and configure
possibly external Redis and Mongo servers:

    docker run -d \
        -e VIRTUAL_HOST=dashboard.example.com \
        -e REDIS_URL=redis://redis.example.com:6379 \
        -e MONGODB_URL=mongodb://mongo.example.com:27017 \
        mdillon/reportr-dashboard

Then run a worker container:

    docker run -d \
        --link some-redis:redis \
        --link some-mongo:mongo \
        mdillon/reportr-dashboard \
        node bin/worker.js
