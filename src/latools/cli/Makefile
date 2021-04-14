MODULES+=


.PHONY: all
all: __init__.py cli.tex
all: ${MODULES:.nw=.tex} ${MODULES:.nw=.py}

__init__.py: cli.py
	${MV} $< $@


.PHONY: clean
clean:
	${RM} __init__.py cli.py cli.tex
	${RM} ${MODULES:.nw=.tex} ${MODULES:.nw=.py}

.PHONY: distclean
distclean:
	true


INCLUDE_MAKEFILES=../../../makefiles
include ${INCLUDE_MAKEFILES}/noweb.mk

