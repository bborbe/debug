REGISTRY ?= docker.io
ifeq ($(VERSION),)
	VERSION = $(shell git fetch --tags; git describe --tags `git rev-list --tags --max-count=1`)
endif

default: build

clean:
	docker rmi $(REGISTRY)/bborbe/debug:$(VERSION)

build:
	docker build --no-cache --rm=true -t $(REGISTRY)/bborbe/debug:$(VERSION) .

run:
	docker run $(REGISTRY)/bborbe/debug:$(VERSION)

shell:
	docker run -i -t $(REGISTRY)/bborbe/debug:$(VERSION) /bin/bash

upload:
	docker push $(REGISTRY)/bborbe/debug:$(VERSION)
