#!/bin/bash
set -e

# Run database migrations and other necessary startup tasks
rails db:create
rails db:migrate
rails markets:check_new_markets

# Execute the main command (CMD in Dockerfile)
exec "$@"