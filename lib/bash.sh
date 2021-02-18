#!/usr/bin/env bash
# shellcheck disable=SC1091

LIBDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# shellcheck source=./banner.sh
source "${LIBDIR}/banner.sh"
# shellcheck source=./echos.sh
source "${LIBDIR}/echos.sh"
# shellcheck source=./opts.sh
source "${LIBDIR}/opts.sh"
