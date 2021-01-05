# Copyright 2015 tsuru authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.
FROM golang:1.11.13-alpine AS builder
RUN apk update && apk add git gcc # bind-dev
RUN mkdir /app
WORKDIR /app
COPY . /app

RUN go version
ENV GO111MODULE=on
ENV CGO_ENABLED=0
ENV GOOS=linux
RUN go install
RUN go build -ldflags '-s -w' -o planb ./main.go

FROM alpine:3.11.3
RUN apk update && apk add libc6-compat

COPY --from=builder /app/planb /bin/planb

ENTRYPOINT ["/bin/planb"]
