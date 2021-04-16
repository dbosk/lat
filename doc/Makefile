.PHONY: all
all: notes.pdf slides.pdf

LATEXFLAGS+=	-shell-escape
TEX_PYTHONTEX=	yes

SRC+=		preamble.tex
SRC+=		abstract.tex contents.tex

CODE+=		../src/latools/cli/cli.tex
CODE+=		../src/latools/cli/grades.tex
CODE+=		../src/latools/cli/time.tex
CODE+=		../src/latools/latools.tex

notes.pdf: notes.tex
notes.pdf: ${SRC} ${CODE}

slides.pdf: slides.tex
slides.pdf: ${SRC} ${CODE}

../%:
	${MAKE} -C $(dir $@) $(notdir $@)


.PHONY: clean
clean:
	${RM} notes.pdf slides.pdf


#include data.mk

notes.pdf slides.pdf: ${DEPENDS}


INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
