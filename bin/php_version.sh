#!/usr/bin/env bash

php_path="${1:-$(which php)}"

# Test PHP command.
function test_php {
    $php_path -v > /dev/null 2>&1
}

if ! test_php; then
    echo "::error title=PHP Not Found::Unable to find PHP at '${php_path}'"
    exit 1
fi

php_version=$($php_path -r 'echo phpversion();')

echo "::notice title=PHP Path::PHP path is '${php_path}'"
echo "::notice title=PHP Version::PHP version is '${php_version}'"
echo "::set-output name=path::${php_path}"
echo "::set-output name=version::${php_version}"
