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

echo "===== Running: MYPY ====="
mypy "$1" --show-error-codes --show-error-context --pretty ${3}

echo "===== Running: PYLINT ====="
if [ "$7" ]; then
  if [ "$2" = "high" ]; then
    pylint "$1" --load-plugins pylint_django ${4}
    echo "===== Running: BLACK ====="
    black "$1" ${5} --exclude "migrations" --check
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${6} -c

  elif [ "$2" = "medium" ]; then
    pylint "$1" --load-plugins pylint_django --fail-under=7 ${4}
    echo "===== Running: BLACK ====="
    black "$1" ${5} --exclude "migrations" --check
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${6} --diff

  else
    pylint "$1" --load-plugins pylint_django --exit-zero ${4}
    echo "===== Running: BLACK ====="
    black "$1" ${5} --exclude "migrations" --diff
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${6} --diff
  fi

else
  if [ "$2" = "high" ]; then
    pylint "$1" ${4}
    echo "===== Running: BLACK ====="
    black "$1" ${5} --check
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${6} -c

  elif [ "$2" = "medium" ]; then
    pylint "$1" --fail-under=7 ${4}
    echo "===== Running: BLACK ====="
    black "$1" ${5} --check
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${6} --diff

  else
    pylint "$1" --exit-zero ${4}
    echo "===== Running: BLACK ====="
    black "$1" ${5} --diff
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${6} --diff
  fi
fi

echo "Done 🎉" ; echo ""