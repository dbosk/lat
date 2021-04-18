VERSION+=	latest

.PHONY: all
all: docker-image

.PHONY: publish
publish: docker-image
	for v in ${VERSION}; do docker push dbosk/lat:$$v; done

.PHONY: docker-image
docker-image:
	docker build --no-cache -t lat .
	for v in ${VERSION}; do docker tag lat dbosk/lat:$$v; done

.PHONY: clean
clean:
	true

.PHONY: distclean
distclean:
	-docker image rm -f lat dbosk/lat
