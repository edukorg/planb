# Copyright 2015 tsuru authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.
FROM golang:alpine as builder
RUN apk update && apk add libc6-compat git
# RUN apk add --no-cache git
COPY . /go/src/planb
WORKDIR /go/src/planb

ENV GO111MODULE=on
# RUN go install
RUN go build -ldflags '-s -w' -o planb ./main.go

FROM alpine:3.11.3
RUN apk update && apk add libc6-compat

COPY --from=builder /go/src/planb/planb /bin/planb

ENTRYPOINT ["/bin/planb"]
