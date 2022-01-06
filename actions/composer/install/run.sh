#!/usr/bin/env bash

if [[ ${COMPOSER_INSTALL_DEPENDENCIES} == "lowest" ]]; then
  composer update --ansi --no-interaction --no-progress --prefer-lowest --working-dir="${COMPOSER_WORKING_DIRECTORY}"

  exit $?
fi

if [[ ${COMPOSER_INSTALL_DEPENDENCIES} == "locked" ]]; then
  composer install --ansi --no-interaction --no-progress --working-dir="${COMPOSER_WORKING_DIRECTORY}"

  exit $?
fi

if [[ ${COMPOSER_INSTALL_DEPENDENCIES} == "highest" ]]; then
  composer update --ansi --no-interaction --no-progress --working-dir="${COMPOSER_WORKING_DIRECTORY}"

  exit $?
fi

echo "::error::The value for the \"dependencies\" input needs to be one of \"lowest\", \"locked\"', \"highest\"' - got \"${COMPOSER_INSTALL_DEPENDENCIES}\" instead."

exit 1
