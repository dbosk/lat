MODULES+=	grades.nw
MODULES+=	time.nw


.PHONY: all
all: __init__.py cli.tex
all: ${MODULES:.nw=.tex} ${MODULES:.nw=.py}

__init__.py: cli.py
	${MV} $< $@

lat.bash:
	register-python-argcomplete lat > $@


.PHONY: clean
clean:
	${RM} __init__.py cli.py cli.tex
	${RM} ${MODULES:.nw=.tex} ${MODULES:.nw=.py}
	${RM} lat.bash

.PHONY: distclean
distclean:
	true


INCLUDE_MAKEFILES=../../../makefiles
include ${INCLUDE_MAKEFILES}/noweb.mk

