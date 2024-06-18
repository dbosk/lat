LATEXFLAGS+=  -shell-escape

.PHONY: all
all: results.pdf results

results.pdf: results.tex results.sh
results: results.sh
	ln $< $@
	chmod +x $@
Makefile: results.nw
	${NOTANGLE.mk}
results.pdf: didactic.sty

INCLUDE_DIDACTIC=../didactic
include ${INCLUDE_DIDACTIC}/didactic.mk
INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
