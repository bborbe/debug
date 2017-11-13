#!/bin/sh

set -e

make build
make upload
make clean || true
