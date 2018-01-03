LATEX = latex
PDFM = dvipdfm
PDFVIEWER = evince

%.pdf : %.dvi
	$(PDFM) $<

%.dvi :: $.tex
	$(LATEX) --interaction=batchmode $<

view : book_1.pdf
	$(PDFVIEWER) $< &

.PHONY : clean 

clean :
	-\rm *.aux
	-\rm *.dvi
	-\rm *.log
	-\rm texput.log

cleanall : clean
	-\rm *.pdf
