#!/bin/bash

set -e

echo "Running..."

if [ "$3" ]; then
 pylint "$1" --load-plugins pylint_django --exit-zero
 black "$1" --line-length "$2" --exclude "migrations" --check

else
  pylint "$1" --exit-zero
  black "$1" --line-length "$2" --check

fi

mypy "$1" ${4}
isort "$1"/**/*.py -m 3 -tc ${5} -c

echo "Done 🎉"