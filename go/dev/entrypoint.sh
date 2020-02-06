#!/bin/sh

set -e

go get -d -v ./...
go install -v ./...
CompileDaemon -directory=app -command=app -color=true