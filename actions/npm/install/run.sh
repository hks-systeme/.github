#!/usr/bin/env bash

if [[ ${NPM_INSTALL_DEPENDENCIES} == "locked" ]]; then
  npm install --prefix="${NPM_WORKING_DIRECTORY}"

  exit $?
fi

if [[ ${NPM_INSTALL_DEPENDENCIES} == "highest" ]]; then
  npm update --prefix="${NPM_WORKING_DIRECTORY}"

  exit $?
fi

echo "::error::The value for the \"dependencies\" input needs to be one of \"lowest\", \"locked\"', \"highest\"' - got \"${NPM_INSTALL_DEPENDENCIES}\" instead."

exit 1
