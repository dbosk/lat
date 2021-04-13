time.py time.tex: time.nw

grade-dist.py: grades.nw
	${NOTANGLE}

grades.tex: grades.nw

.PHONY: clean clean-noweb
clean: clean-noweb
clean-noweb:
	${RM} time.py time.tex
	${RM} grade-dist.py
	${RM} grades.tex


DD1315-LAB1-time.pgf DD1315-LAB1-time.tex: DD1315.csv time.py
	(head -n 1 DD1315.csv; grep LAB1 DD1315.csv) | \
		python time.py -n -g Round \
			-G 51386 \
			-G 50869 50662 50650 50523 \
			-G 50917 51210 50094 50167 60420 \
			-f DD1315-LAB1-time.pgf \
			> DD1315-LAB1-time.tex

DEPENDS+=$(addsuffix .pgf,DD1315-LAB1-time)
DEPENDS+=$(addsuffix .tex,DD1315-LAB1-time)

DD1315-LAB2-time.pgf DD1315-LAB2-time.tex: DD1315.csv time.py
	(head -n 1 DD1315.csv; grep LAB2 DD1315.csv) | \
		python time.py -n -g Round \
			-G 51386 \
			-G 50869 50662 50650 50523 \
			-G 50917 51210 50094 50167 60420 \
			-f DD1315-LAB2-time.pgf \
			> DD1315-LAB2-time.tex

DEPENDS+=$(addsuffix .pgf,DD1315-LAB2-time)
DEPENDS+=$(addsuffix .tex,DD1315-LAB2-time)

DD1315-LAB3-time.pgf DD1315-LAB3-time.tex: DD1315.csv time.py
	(head -n 1 DD1315.csv; grep LAB3 DD1315.csv) | \
		python time.py -n -g Round \
			-G 51386 \
			-G 50869 50662 50650 50523 \
			-G 50917 51210 50094 50167 60420 \
			-f DD1315-LAB3-time.pgf \
			> DD1315-LAB3-time.tex

DEPENDS+=$(addsuffix .pgf,DD1315-LAB3-time)
DEPENDS+=$(addsuffix .tex,DD1315-LAB3-time)


DD1315-all.pgf DD1315-all.tex: DD1315.csv grade-dist.py
	(head -n 1 DD1315.csv; grep LAB3 DD1315.csv) | \
		python grade-dist.py -nLf DD1315-all.pgf \
			-G 51386 \
			-G 50869 -G 50662 -G 50650 \
			-G 50523 -G 50917 -G 51210 -G 50094 -G 50167 -G 60420 \
				> DD1315-all.tex

DD1315-grouped.pgf DD1315-grouped.tex: DD1315.csv grade-dist.py
	(head -n 1 DD1315.csv; grep LAB3 DD1315.csv) | \
		python grade-dist.py -nL -f DD1315-grouped.pgf \
			-G 51386 \
			-G 50869 50662 50650 50523 \
			-G 50917 51210 50094 50167 60420 \
				> DD1315-grouped.tex

DD1315-last.pgf DD1315-last.tex: DD1315.csv grade-dist.py
	(head -n 1 DD1315.csv; grep LAB3 DD1315.csv) | \
		python grade-dist.py -nL -f DD1315-last.pgf \
			-G 51386 \
			-G 50869 50662 50650 50523 50917 51210 50094 50167 60420 \
				> DD1315-last.tex

DEPENDS+=$(addsuffix .pgf,DD1315-all DD1315-grouped DD1315-last)
DEPENDS+=$(addsuffix .tex,DD1315-all DD1315-grouped DD1315-last)


DD1310-all.pgf DD1310-all.tex: DD1310.csv grade-dist.py
	(head -n 1 DD1310.csv; grep LAB3 DD1310.csv) | \
		python grade-dist.py -nL -f DD1310-all.pgf \
			-G 50156 \
			-G 50142 \
			-G 50310 \
			-G 50219 \
			-G 50429 -G 50649 -G 50519 -G 50914 -G 50018 \
				> DD1310-all.tex

DD1310-grouped.pgf DD1310-grouped.tex: DD1310.csv grade-dist.py
	(head -n 1 DD1310.csv; grep LAB3 DD1310.csv) | \
		python grade-dist.py -nL -f DD1310-grouped.pgf \
			-G 50156 \
			-G 50142 \
			-G 50310 \
			-G 50219 \
			-G 50429 50649 50519 50914 50018 \
				> DD1310-grouped.tex

DEPENDS+=$(addsuffix .pgf,DD1310-all DD1310-grouped)
DEPENDS+=$(addsuffix .tex,DD1310-all DD1310-grouped)


DD1312-all.pgf DD1312-all.tex: DD1312.csv grade-dist.py
	(head -n 1 DD1312.csv; grep LAB3 DD1312.csv) | \
		python grade-dist.py -nL -f DD1312-all.pgf \
			-G 50730 \
			-G 50864 \
			-G 50661 \
			-G 50943 \
				> DD1312-all.tex

DD1312-grouped.pgf DD1312-grouped.tex: DD1312.csv grade-dist.py
	(head -n 1 DD1312.csv; grep LAB3 DD1312.csv) | \
		python grade-dist.py -nL -f DD1312-grouped.pgf \
			-G 50730 \
			-G 50864 50661 50943 \
				> DD1312-grouped.tex

DEPENDS+=$(addsuffix .pgf,DD1312-all DD1312-grouped)
DEPENDS+=$(addsuffix .tex,DD1312-all DD1312-grouped)


.PHONY: clean clean-data
clean: clean-data
clean-data:
	${RM} ${DEPENDS}



INCLUDE_MAKEFILES=./makefiles
include ${INCLUDE_MAKEFILES}/noweb.mk
