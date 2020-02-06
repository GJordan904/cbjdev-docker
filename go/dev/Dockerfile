FROM golang:1.12-alpine

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh \
    && apk add --update --no-cache git \
    && go get github.com/githubnemo/CompileDaemon

WORKDIR /go/src/app

ENTRYPOINT /usr/local/bin/entrypoint.sh