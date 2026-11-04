IMAGE ?= harbor.agoracalyce.net/build-pages/agora-spx-docs
IMAGE_CLIENT ?= harbor.agoracalyce.net/build-pages/agora-spx-docs-client
TAG ?= latest
MDLINT ?= docker run --rm -v "$(CURDIR)":/workdir davidanson/markdownlint-cli2:v0.18.1

.PHONY: build run push build-client run-client push-client lint-md format-md

# Check Markdown list formatting (config: .markdownlint-cli2.yaml)
lint-md:
	$(MDLINT)

# Fix Markdown list formatting in place
format-md:
	$(MDLINT) --fix

build:
	docker build -f docker/Dockerfile -t $(IMAGE):$(TAG) .

run: build
	docker run --rm -it -p 8080:8080 $(IMAGE):$(TAG)

push: build
	docker push $(IMAGE):$(TAG)

build-client:
	docker build -f docker/Dockerfile.client -t $(IMAGE_CLIENT):$(TAG) .

run-client: build-client
	docker run --rm -it -p 8081:8080 $(IMAGE_CLIENT):$(TAG)

push-client: build-client
	docker push $(IMAGE_CLIENT):$(TAG)
