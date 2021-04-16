SUBDIR_GOALS=	all clean distclean

SUBDIR+=	cli

MODULES+=


.PHONY: all
all: __init__.py latools.tex
all: ${MODULES:.nw=.tex} ${MODULES:.nw=.py}

__init__.py: latools.py
	${MV} $< $@


.PHONY: clean
clean:
	${RM} __init__.py latools.py latools.tex
	${RM} ${MODULES:.nw=.tex} ${MODULES:.nw=.py}

.PHONY: distclean
distclean:
	true


INCLUDE_MAKEFILES=../../makefiles
include ${INCLUDE_MAKEFILES}/noweb.mk
include ${INCLUDE_MAKEFILES}/subdir.mk
