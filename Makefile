SUBDIR_GOALS=	all clean distclean

SUBDIR+= 	src/lat
SUBDIR+=	doc
SUBDIR+=	docker

lat+=	src/lat/__init__.py
lat+=	src/lat/cli/__init__.py
lat+=	src/lat/cli/grades.py
lat+=	src/lat/cli/time.py

version=$(shell sed -n 's/^ *version *= *\"\([^\"]\+\)\"/\1/p' pyproject.toml)
dist=$(addprefix dist/lat-${version}, -py3-none-any.whl .tar.gz)


.PHONY: all
all:
	true

.PHONY: install
install: setup.py
	pip3 install -e .

setup.py: pyproject.toml ${lat}
	dephell deps convert --from-path pyproject.toml --from-format poetry \
		--to-path setup.py --to-format setuppy

${lat} doc/lat.pdf:
	${MAKE} -C $(dir $@) $(notdir $@)

lat.bash: install
	register-python-argcomplete ladok > $@

.PHONY: build
build: ${lat}
	poetry build

.PHONY: publish publish-lat publish-docker
publish: publish-lat publish-docker doc/lat.pdf
	git push
	gh release create -t v${version} v${version} doc/lat.pdf

publish-lat: ${dist}
	#python3 -m twine upload -r pypi ${dist}
	poetry publish

${dist}: ${lat}
	#python3 -m build
	poetry build

publish-docker:
	sleep 60
	${MAKE} -C docker publish


.PHONY: clean
clean:
	${RM} setup.py lat.bash

.PHONY: distclean
distclean:
	${RM} -R build dist lat.egg-info src/lat.egg-info


INCLUDE_MAKEFILES=./makefiles
include ${INCLUDE_MAKEFILES}/subdir.mk
