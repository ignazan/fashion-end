#!/bin/sh

yarn medusa db:migrate

yarn seed

yarn start
