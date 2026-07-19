#!/usr/bin/env bash

set -euo pipefail

# Compatibility entry point. FFmpeg 7 is now the default Android build.
exec "$(dirname "$0")/install-ffmpeg.sh" "$@"
