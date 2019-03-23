# Two stacks (dependent)

This project has two separate stacks and we run them on the same network so they can communicate. Specifically we run
the server as normal and it creates the default network, then we run the client in a way that it reuses the server's
network. This means that the client is *dependent* on the server. You cannot run the client unless the server stack is
running.

The approach is mentioned in the [docs](https://docs.docker.com/compose/networking/#use-a-pre-existing-network).

Pros:

  - it works
  - perhaps it's marginally easier than the independent version

Cons:

  - you *must* start the server first and stop it last as it controls the network
  - you *must* run both stacks on the same host. Or if you run the client stack on a separate host, you need to manually
      create the docker network before starting.

## Running

  1. start the server stack
      ```bash
      cd server/
      docker-compose up -d
      cd ..
      ```
  1. start the client stack
      ```bash
      cd client/
      docker-compose up
      ```
  1. you'll see the logs of the client doing a curl once per second. This client stack is communicating with the server
     stack, which was deployed separately!
  1. `ctrl+c` to exit
  1. remove the client stack
      ```bash
      docker-compose down
      ```
  1. remove the server stack
      ```bash
      cd ../server/
      docker-compose down
      ```
