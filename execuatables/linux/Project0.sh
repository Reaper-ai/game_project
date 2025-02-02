#!/bin/sh
echo -ne '\033c\033]0;Project0\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Project0.x86_64" "$@"
