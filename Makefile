# https://github.com/rnubel/pgmgr/issues/47
GO111MODULE := on
export GO111MODULE

GO := "/usr/lib/go-1.11/bin/go"

TAG = `git rev-parse --verify HEAD`

setup:
	$(GO) version

install: setup
	$(GO) install

test: install
	$(GO) test

gcp-build:
	git diff-index --quiet HEAD -- || exit 1
	docker build . -t gcr.io/eduk-tsuru/tsuru-planb:${TAG}

gcp-push: gcp-build
	gcloud auth configure-docker
	docker push gcr.io/eduk-tsuru/tsuru-planb:${TAG}
