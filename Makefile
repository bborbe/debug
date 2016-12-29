VERSION ?= 1.0.0

default: build

clean:
	docker rmi bborbe/debug:$(VERSION)

build:
	docker build --build-arg VERSION=$(VERSION) --no-cache --rm=true -t bborbe/debug:$(VERSION) .

run:
	docker run bborbe/debug:$(VERSION)

shell:
	docker run -i -t bborbe/debug:$(VERSION) /bin/bash

upload:
	docker push bborbe/debug:$(VERSION)
