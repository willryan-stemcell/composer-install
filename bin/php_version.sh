#!/usr/bin/env bash

php_version=$(php -r 'echo phpversion();')

echo "::notice title=PHP Version::PHP version is '${php_version}'"
echo "::set-output name=php::${php_version}"
