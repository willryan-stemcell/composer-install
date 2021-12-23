#!/usr/bin/env bash

cache_dir="$(composer config cache-dir)"

echo "::notice title=Composer Cache::Composer cache directory found at '${cache_dir}'"
echo "::set-output name=directory::${cache_dir}"
