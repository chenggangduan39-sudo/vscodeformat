#!/usr/bin/env bash

set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

while IFS= read -r extension_id; do
    if [[ -n "$extension_id" && "$extension_id" != \#* ]]; then
        code --install-extension "$extension_id" --force
    fi
done < "$script_dir/extensions.txt"
