#doc   = 200318ExamenParcial
#doc   = 140518ExamenParcialFinal
#doc   = 310518ExamenRecuperacio1
doc   = 050618ExamenRecuperacio2

all: $(doc)Preguntes.pdf $(doc)Respostes.pdf $(doc)FullRespostes.pdf #$(doc)Preguntas.pdf

$(doc)Preguntes.pdf: $(doc).tex urmathtest_cat.sty
	sed -e 's/TYPE/questions/' $(doc).tex > $(doc)Preguntes.tex
	lualatex $(doc)Preguntes

#$(doc)Preguntas.pdf: $(doc)_cast.tex urmathtest_cat.sty
#	sed -e 's/TYPE/questions/' $(doc)_cast.tex > $(doc)Preguntas.tex
#	lualatex $(doc)Preguntas

$(doc)FullRespostes.pdf: $(doc).tex urmathtest_cat.sty
	sed -e 's/TYPE/answersheet/' $(doc).tex > $(doc)FullRespostes.tex
	lualatex $(doc)FullRespostes
	lualatex $(doc)FullRespostes

$(doc)Respostes.pdf: $(doc).tex urmathtest_cat.sty
	sed -e 's/TYPE/answers/' $(doc).tex > $(doc)Respostes.tex
	lualatex $(doc)Respostes

tar:
	tar cvf $(doc).tar *tex *pdf Makefile *png *jpg *sty
	gzip $(doc).tar

clean:
	rm -f $(doc)*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
cleanall:
	rm -f $(doc)*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f $(doc)*.pdf
