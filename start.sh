#!/bin/sh

set -e

node server/index.js &
h2o -c h2o/h2o.conf &
