SHELL := /bin/bash
#doc   = 200318ExamenParcial
#doc   = 140518ExamenParcialFinal
doc   = 310518ExamenRecuperacio1
#doc   = 050618ExamenRecuperacio2
docpath = ../build/$(doc)

all: $(docpath)Preguntes.pdf $(docpath)Respostes.pdf $(docpath)FullRespostes.pdf clean #$(doc)Preguntas.pdf

$(docpath)Preguntes.pdf: $(doc).tex urmathtest_cat.sty
	sed -e 's/TYPE/questions/' $(doc).tex > $(docpath)Preguntes.tex
	lualatex $(docpath)Preguntes
	cp $(doc)Preguntes.pdf ../build

$(docpath)FullRespostes.pdf: $(doc).tex urmathtest_cat.sty
	sed -e 's/TYPE/answersheet/' $(doc).tex > $(docpath)FullRespostes.tex
	lualatex $(docpath)FullRespostes
	lualatex $(docpath)FullRespostes
	cp $(doc)FullRespostes.pdf ../build

$(docpath)Respostes.pdf: $(doc).tex urmathtest_cat.sty
	sed -e 's/TYPE/answers/' $(doc).tex > $(docpath)Respostes.tex
	lualatex $(docpath)Respostes
	cp $(doc)Respostes.pdf ../build

EX:
	@for name in E1 Combustio ForcesInt Piles Llum Materials Temperatura; do \
		FILE=_GEA$$name; \
		cp $(HEADER_FOOTER_TEMPLATE) ../build/temp_header_footer_$$name.tex; \
		sed -i "s|AUTOAV_FILE|$$FILE|" ../build/temp_header_footer_$$name.tex; \
		sed -i "s|NAME_FILE|$$name|" ../build/temp_header_footer_$$name.tex; \
		$(LATEXMK) -output-directory=../build ../build/temp_header_footer_$$name.tex; \
		rsync --update ../build/temp_header_footer_$$name.pdf ${PDFDIR}/$$FILE.pdf; \
	done

clean:
	rm -f *.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f $(docpath)*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
