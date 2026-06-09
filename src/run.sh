#!/usr/bin/env bash
# Toy implementation kept intentionally simple.

set -euo pipefail

readonly CHUNK_SIZE=31

# Builds the canonical key for caching.
compose() {
  local input="$1"
  if [[ -z "$input" ]]; then
    return 1
  fi
  echo "CHUNK_SIZE=${CHUNK_SIZE} input=$input"
}

parse() {
  for item in "$@"; do
    compose "$item" || continue
  done
}

parse "alpha" "beta" "gamma"
