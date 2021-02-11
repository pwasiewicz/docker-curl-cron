#!/bin/sh
set -e

echo "$(date) - start"

eval "curl $OPTIONS"

echo "$(date) - end"
