# Two stacks (independent)

This project has two separate stacks and we run them on the same network so they can communicate. Unlike the *dependent*
version where you *must* start the server first, this version doesn't care. We set the name of the default network to be
the same between the two stacks so they run nicely together.

Pros:

  - you can start/stop either stack in any order
  - no need to define a custom network for every container
  - you can run both stacks on the same host or separate hosts without any code changes (although on separate hosts your
      client container will need to have the `TARGET_HOST` changed to the publicly accessible one)

Cons:

  - you'll see an error when you try to stop the first of the two stacks because the second is still using the network.
      All other parts should (hopefully) still be removed from the stack and the network will go when you stop the other
      stack.

## Running

  1. start the client stack first. You don't have to but we're proving a point
      ```bash
      cd client/
      docker-compose up
      ```
  1. you'll see errors in the logs from the client because the server isn't up, that's expected
  1. now open a new terminal and start the server stack
      ```bash
      cd server/
      docker-compose up -d
      ```
  1. if you check the logs of the client now, the requests will start working. You're communicating between the two
     stacks!
  1. `ctrl+c` to exit the client
  1. remove the client stack
      ```bash
      docker-compose down
      ```
  1. remove the server stack
      ```bash
      cd ../server/
      docker-compose down
      ```
