$ErrorActionPreference = "Stop"

Get-Content (Join-Path $PSScriptRoot "extensions.txt") |
    Where-Object { $_ -and -not $_.StartsWith("#") } |
    ForEach-Object {
        code --install-extension $_ --force
    }
