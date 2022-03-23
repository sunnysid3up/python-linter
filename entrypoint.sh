#!/bin/bash

set -e

# source = $1
# strict = $2
# mypy-options = $3
# pylint-options = $4
# black-options = $5
# isort-options = $6
# django = $7

echo "===== Running Python Linter - '$2' ====="
echo "Django project? '$7'"

echo "Running mypy"
mypy "$1" --show-error-codes --show-error-context --pretty ${3}

echo "Running black"
if [ "$7" ]; then
  if [ "$2" = "high" ]; then
    black "$1" ${5} --exclude "migrations" --check
    echo "Running isort"
    isort "$1"/**/*.py -m 3 --trailing-comma ${6} -c
    echo "Running pylint"
    pylint "$1" --load-plugins pylint_django ${4}

  elif [ "$2" = "medium" ]; then
    black "$1" ${5} --exclude "migrations" --check
    echo "Running isort"
    isort "$1"/**/*.py -m 3 --trailing-comma ${6} -c
    echo "Running pylint"
    pylint "$1" --load-plugins pylint_django --fail-under=8 ${4}

  else
    black "$1" ${5} --exclude "migrations" --check
    echo "Running isort"
    isort "$1"/**/*.py -m 3 --trailing-comma ${6} --diff
    echo "Running pylint"
    pylint "$1" --load-plugins pylint_django --exit-zero ${4}
  fi

else
  if [ "$2" = "high" ]; then
    black "$1" ${5} --check
    echo "Running isort"
    isort "$1"/**/*.py -m 3 --trailing-comma ${6} -c
    echo "Running pylint"
    pylint "$1" ${4}

  elif [ "$2" = "medium" ]; then
    black "$1" ${5} --check
    echo "Running isort"
    isort "$1"/**/*.py -m 3 --trailing-comma ${6} -c
    echo "Running pylint"
    pylint "$1" --fail-under=8 ${4}

  else
    black "$1" ${5} --check
    echo "Running isort"
    isort "$1"/**/*.py -m 3 --trailing-comma ${6} --diff
    echo "Running pylint"
    pylint "$1" --exit-zero ${4}
  fi
fi

echo "Done";
