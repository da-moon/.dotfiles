#!/usr/bin/env bash
# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# if command -- docker -h > /dev/null 2>&1 ; then
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS="auto"
# fi
# if command -- docker-compose -h > /dev/null 2>&1 ; then
export COMPOSE_DOCKER_CLI_BUILD=1
# fi
