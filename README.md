# pwasiewicz/curl-cron

Docker image that runs periodically runs a curl command

## Why is this forked? 
Unfortunately, the original image disallows you to use command in env variables when used in docker compose:
```
environment:
    URL: '-X POST  -H  ''accept: */*'' -d '''' ''http://example.com'''
```

Arguments are incorrectly parsed and curl was not invoked.
**This repo fixes curl invocation to support mentioned cases.**

## Usage

    docker run -d [OPTIONS] jsonfry/curl-cron


### Required Parameters:

* `-e OPTIONS=<OPTIONS>`: curl command options
* `-e CRON_SCHEDULE="0 1 * * *"`: specifies when cron job starts ([details](http://en.wikipedia.org/wiki/Cron)), e.g. `0 1 * * *` (runs every night at 1:00).

### Optional parameters:

* `now`: run container once and exit (no cron scheduling).

## Examples:

Run every hour with cron schedule (container keeps running):

    docker run -d \
        -e OPTIONS=example.com \
        -e CRON_SCHEDULE="0 1 * * *" \
        jsonfry/curl-cron

Run just once (container is deleted afterwards):

    docker run --rm \
        -e OPTIONS=example.com \
        jsonfry/curl-cron now


