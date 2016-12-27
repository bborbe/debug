default: build

clean:
	docker rmi bborbe/debug:latest

build:
	docker build --no-cache --rm=true -t bborbe/debug:latest .

run:
	docker run bborbe/debug:latest

shell:
	docker run -i -t bborbe/debug:latest /bin/bash

upload:
	docker push bborbe/debug
