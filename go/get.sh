#!/bin/bash

set -e

PKGS=(
	# General usage
	github.com/x-motemen/ghq

	# Go cmd
	golang.org/x/tools/cmd/goimports
	golang.org/x/tools/cmd/benchcmp
	golang.org/x/tools/cmd/present
	github.com/ChimeraCoder/gojson/gojson
	github.com/golang/dep/cmd/dep
	mvdan.cc/sh/cmd/shfmt
	github.com/davecheney/httpstat
	github.com/kyoshidajp/ghkw

	# Golang dev
	github.com/nsf/gocode
	github.com/rogpeppe/godef
	github.com/dougm/goflymake
	github.com/jstemmer/gotags
	github.com/k0kubun/pp
	github.com/tools/godep
	github.com/motemen/gore
	github.com/tcnksm/ghr
)

for pkg in ${PKGS[@]}; do
	go get -u -v $pkg
done
