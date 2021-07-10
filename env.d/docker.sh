if command -- docker -h > /dev/null 2>&1 ; then
  export DOCKER_BUILDKIT=1
  export BUILDKIT_PROGRESS="plain"
fi
if command -- docker-compose -h > /dev/null 2>&1 ; then
  export COMPOSE_DOCKER_CLI_BUILD=1
fi