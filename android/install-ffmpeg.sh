#!/usr/bin/env bash

set -euo pipefail

# FFmpeg 7.1.1 is the only supported Android media stack.
../FFToolChain/main.sh init -p android -l 'openssl3 xml2 ijkffmpeg7'
../FFToolChain/main.sh compile -p android -l 'openssl3 xml2 ijkffmpeg7' -c build
../FFToolChain/main.sh install -p android -l 'soundtouch yuv'
