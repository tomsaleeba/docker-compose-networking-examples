> a demo of docker-compose networking

I wanted to learn how to have two separate docker-compose networks communicate on the same network and this repo is me
codifying that learning.

Check the README in each directory for what the example does and how to run it.

Note: we use the `init: true` [feature](https://docs.docker.com/compose/compose-file/#init) of Docker so you'll need a
new enough docker and docker-compose to support the `3.7` version of the docker-compose file format.
