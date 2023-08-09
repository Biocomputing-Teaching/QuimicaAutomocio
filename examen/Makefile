#doc   = 200318ExamenParcial
#doc   = 140518ExamenParcialFinal
#doc   = 310518ExamenRecuperacio1
doc   = 050618ExamenRecuperacio2
docpath = ../build/$(doc)

all: $(docpath)Preguntes.pdf $(docpath)Respostes.pdf $(docpath)FullRespostes.pdf clean #$(doc)Preguntas.pdf

$(docpath)Preguntes.pdf: $(doc).tex urmathtest_cat.sty
	cp urmathtest_cat.sty ../build/urmathtest_cat.sty
	sed -e 's/TYPE/questions/' $(doc).tex > $(docpath)Preguntes.tex
	lualatex $(docpath)Preguntes
	mv $(doc)Preguntes.pdf ../build

$(docpath)FullRespostes.pdf: $(doc).tex urmathtest_cat.sty
	cp urmathtest_cat.sty ../build/urmathtest_cat.sty
	sed -e 's/TYPE/answersheet/' $(doc).tex > $(docpath)FullRespostes.tex
	lualatex $(docpath)FullRespostes
	lualatex $(docpath)FullRespostes
	mv $(doc)FullRespostes.pdf ../build

$(docpath)Respostes.pdf: $(doc).tex urmathtest_cat.sty
	cp urmathtest_cat.sty ../build/urmathtest_cat.sty
	sed -e 's/TYPE/answers/' $(doc).tex > $(docpath)Respostes.tex
	lualatex $(docpath)Respostes
	mv $(doc)Respostes.pdf ../build

clean:
	rm -f $(doc)*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
cleanall:
	rm -f $(docpath)*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f $(docpath)*.pdf
