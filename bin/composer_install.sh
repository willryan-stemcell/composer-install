#!/usr/bin/env bash

dependency_versions="${1:-locked}"
additional_composer_options="${2}"
working_directory="${3}"

composer_command="update"
composer_options=(
    "--no-interaction"
    "--no-progress"
    "--ansi"
)

case "${dependency_versions}" in
    locked) composer_command="install" ;;
    lowest) composer_options+=("--prefer-lowest" "--prefer-stable") ;;
    highest) ;;
esac

IFS=' '
additional_options=("${additional_composer_options}")
for option in "${additional_options[@]}"; do
    composer_options+=("${option}")
done

if [ -n "${working_directory}" ]; then
    composer_options+=("--working-dir")
    composer_options+=("${working_directory}")
fi

echo "::notice title=Composer::Using the following Composer command: 'composer ${composer_command} ${composer_options[*]}'"
composer "${composer_command}" ${composer_options[*]}
