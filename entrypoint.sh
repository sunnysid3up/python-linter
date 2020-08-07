#!bin/bash
set -ex

    - ${{ inputs.lint }}
    - ${{ inputs.path }}
    - ${{ inputs.line-length }}
    - ${{ inputs.style }}

echo Starting: "$1"

if [ "$1" = "black" ]; then
  black $2 --line-length $3 --check
fi

if [ "$1" = "yapf"]; then
  yapf $2 --style $4 --verbose
fi

echo Done :B
