#!/bin/bash

set -e

# source = $1
# strict = $2
# black-options = $3
# mypy-options = $4
# isort-options = $5
# django = $6

echo "===== Running Python Linter - '$2' ====="
echo "Django project? '$6'"

echo "===== Running: MYPY ====="
mypy "$1" --show-error-codes --show-error-context --pretty ${4}

echo "===== Running: PYLINT ====="
if [ "$6" ]; then
  if [ "$2" = "high" ]; then
    pylint "$1" --load-plugins pylint_django
    echo "===== Running: BLACK ====="
    black "$1" ${3} --exclude "migrations" --check
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${5} -c

  elif [ "$2" = "medium" ]; then
    pylint "$1" --load-plugins pylint_django --fail-under=7
    echo "===== Running: BLACK ====="
    black "$1" ${3} --exclude "migrations" --check
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${5} --diff

  else
    pylint "$1" --load-plugins pylint_django --exit-zero
    echo "===== Running: BLACK ====="
    black "$1" ${3} --exclude "migrations" --diff
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${5} --diff
  fi

else
  if [ "$2" = "high" ]; then
    pylint "$1"
    echo "===== Running: BLACK ====="
    black "$1" ${3} --check
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${5} -c

  elif [ "$2" = "medium" ]; then
    pylint "$1"  --fail-under=7
    echo "===== Running: BLACK ====="
    black "$1" ${3} --check
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${5} --diff

  else
    pylint "$1" --exit-zero
    echo "===== Running: BLACK ====="
    black "$1" ${3} --diff
    echo "===== Running: ISORT ====="
    isort "$1"/**/*.py -m 3 -tc ${5} --diff
  fi
fi

echo "Done 🎉" ; echo ""