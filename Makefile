GCP_PROJECT = eduk-tsuru
TAG = `git rev-parse --verify HEAD`

pre-build:
	git diff-index --quiet HEAD -- || exit 1

aws-build: pre-build
	docker build . -t 629980096842.dkr.ecr.us-east-1.amazonaws.com/tsuru-planb:${TAG}

aws-push: aws-build
	docker push 629980096842.dkr.ecr.us-east-1.amazonaws.com/tsuru-planb:${TAG}

gcp-build: pre-build
	docker build . -t gcr.io/${GCP_PROJECT}/tsuru-planb:${TAG}

gcp-push: gcp-build
	gcloud auth configure-docker
	docker push gcr.io/${GCP_PROJECT}/tsuru-planb:${TAG}
