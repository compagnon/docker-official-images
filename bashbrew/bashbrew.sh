#!/usr/bin/env bash
set -Eeuo pipefail

dir="$(readlink -f "$BASH_SOURCE")"
dir="$(dirname "$dir")"
echo $dir

export GOPATH="$dir/go:$dir/go/vendor"
export GO111MODULE=on
(
	go build -o bin/bashbrew bashbrew 
)

exec "bin/bashbrew" "$@"
