.PHONY: all
all: notes.pdf slides.pdf

LATEXFLAGS+=	-shell-escape
TEX_PYTHONTEX=	yes

SRC+=		preamble.tex
SRC+=		abstract.tex contents.tex
SRC+=		grades.tex time.tex

CODE+=		../src/latools/cli/cli.tex

notes.pdf: notes.tex
notes.pdf: ${SRC}

slides.pdf: slides.tex
slides.pdf: ${SRC}

../%:
	${MAKE} -C $(dir $@) $(notdir $@)


.PHONY: clean
clean:
	${RM} notes.pdf slides.pdf


include data.mk

notes.pdf slides.pdf: ${DEPENDS}


INCLUDE_MAKEFILES=./makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
