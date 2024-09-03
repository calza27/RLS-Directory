#!/usr/bin/env bash
die() { echo "${1:-argh}"; exit ${2:-1}; }

hash yq || die "yq not found. Install it with 'brew install yq'"

file=$1
[[ -z $file ]] && die "Usage: $0 <file>"
[[ ! -f $file ]] && die "File not found: $file"

cat $file | yq '.* | key + "=" + .' | tr '\n' ' ' | sed 's/.\{1\}$//'
