#! /usr/bin/env bash

set -e

# Build the FFmpeg 7 variant into the existing third-libs/ijkffmpeg contract.
# OpenSSL and libxml2 are explicit inputs because HTTPS and DASH are core IJK
# capabilities rather than optional host-machine auto-detection.
../FFToolChain/main.sh init -p android -l 'openssl3 xml2 ijkffmpeg7'
../FFToolChain/main.sh compile -p android -l 'openssl3 xml2 ijkffmpeg7' -c build
../FFToolChain/main.sh install -p android -l 'soundtouch yuv'
