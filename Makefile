SUBDIR_GOALS=	all clean distclean

SUBDIR+= 	src/lat
SUBDIR+=	doc
SUBDIR+=	docker

lat+=	src/lat/__init__.py
lat+=	src/lat/cli/__init__.py
lat+=	src/lat/cli/grades.py
lat+=	src/lat/cli/time.py

version=$(shell sed -n 's/^ *version *= *\"\([^\"]\+\)\",/\1/p' setup.py)
dist=$(addprefix dist/lat-${version}, -py3-none-any.whl .tar.gz)


.PHONY: all
all:
	true

.PHONY: install
install: setup.py
	pip3 install -e .

${lat} doc/lat.pdf:
	${MAKE} -C $(dir $@) $(notdir $@)

.PHONY: build
build: ${lat}
	python3 -m build

.PHONY: publish publish-lat publish-docker
publish: publish-lat publish-docker doc/lat.pdf
	git push
	gh release create -t v${version} v${version} doc/lat.pdf

publish-lat: ${dist}
	python3 -m twine upload -r pypi ${dist}

${dist}: ${lat}
	python3 -m build

publish-docker:
	sleep 60
	${MAKE} -C docker publish


.PHONY: clean
clean:
	true

.PHONY: distclean
distclean:
	${RM} -R build dist lat.egg-info src/lat.egg-info


INCLUDE_MAKEFILES=./makefiles
include ${INCLUDE_MAKEFILES}/subdir.mk
