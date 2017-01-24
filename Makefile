VERSION ?= latest
REGISTRY ?= docker.io

default: build

clean:
	docker rmi $(REGISTRY)/bborbe/debug:$(VERSION)

build:
	docker build --build-arg VERSION=$(VERSION) --no-cache --rm=true -t $(REGISTRY)/bborbe/debug:$(VERSION) .

run:
	docker run $(REGISTRY)/bborbe/debug:$(VERSION)

shell:
	docker run -i -t $(REGISTRY)/bborbe/debug:$(VERSION) /bin/bash

upload:
	docker push $(REGISTRY)/bborbe/debug:$(VERSION)
