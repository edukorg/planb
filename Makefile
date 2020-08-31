# https://github.com/rnubel/pgmgr/issues/47
GO111MODULE := on
export GO111MODULE

GO := "/usr/lib/go-1.11/bin/go"

TAG = `git rev-parse --verify HEAD`

setup:
	$(GO) version

install: setup
	$(GO) install

build: setup
	$(GO) build -ldflags '-s -w' -o planb ./main.go

test: setup
	$(GO) test

docker-build: build
	docker build . -t eduk-planb:latest

docker-start: build
	docker run eduk-planb:latest /bin/planb --help

aws-build: build
	git diff-index --quiet HEAD -- || exit 1
	docker build . -t 629980096842.dkr.ecr.us-east-1.amazonaws.com/tsuru-planb:${TAG}

aws-push: docker-build
	docker push 629980096842.dkr.ecr.us-east-1.amazonaws.com/tsuru-planb:${TAG}

gcp-build:
	git diff-index --quiet HEAD -- || exit 1
	docker build . -t gcr.io/eduk-poc-stg/tsuru-planb:${TAG}

gcp-push: gcp-build
	gcloud auth configure-docker
	docker push gcr.io/eduk-poc-stg/tsuru-planb:${TAG}
