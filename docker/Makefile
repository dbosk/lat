VERSION+=	latest

.PHONY: all
all: docker-image

.PHONY: publish
publish: docker-image
	for v in ${VERSION}; do docker push dbosk/latools:$$v; done

.PHONY: docker-image
docker-image:
	docker build --no-cache -t latools .
	for v in ${VERSION}; do docker tag latools dbosk/latools:$$v; done

.PHONY: clean
clean:
	true

.PHONY: distclean
distclean:
	-docker image rm -f latools dbosk/latools
