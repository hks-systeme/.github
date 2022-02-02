#!/usr/bin/env bash

if [[ ${YARN_INSTALL_DEPENDENCIES} == "locked" ]]; then
  yarn install --cwd="${YARN_WORKING_DIRECTORY}"

  exit $?
fi

if [[ ${YARN_INSTALL_DEPENDENCIES} == "highest" ]]; then
  yarn upgrade --cwd="${YARN_WORKING_DIRECTORY}"

  exit $?
fi

echo "::error::The value for the \"dependencies\" input needs to be one of \"lowest\", \"locked\"', \"highest\"' - got \"${YARN_INSTALL_DEPENDENCIES}\" instead."

exit 1
