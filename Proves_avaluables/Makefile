SHELL := /bin/bash
#doc   = 200318ExamenParcial
#doc   = 140518ExamenParcialFinal
doc   = 310518ExamenRecuperacio1
#doc   = 050618ExamenRecuperacio2
docpath = ../build/$(doc)
HEADER_FOOTER_TEMPLATE = header_footer_template_EX.tex
TMPFORM = ../build/temp_formulari.tex

# Dependències dels fitxers en el directori ../common/
COMMON_FILES = $(wildcard ../common/*.tex)
# Comandes per a la compilació
LATEXMK = latexmk -pdf #-quiet

# Directori de destinació per als PDFs generats
PDFDIR = ../../../Web/WebQuimicaAutomocio/docs/pdf/

exams: $(docpath)Preguntes.pdf $(docpath)Respostes.pdf $(docpath)FullRespostes.pdf clean #$(doc)Preguntas.pdf

$(docpath)Preguntes.pdf: $(doc).tex urmathtest_cat.sty
	sed -e 's/TYPE/questions/' $(doc).tex > $(docpath)Preguntes.tex
	$(LATEXMK) $(docpath)Preguntes
	cp $(doc)Preguntes.pdf ../build

$(docpath)FullRespostes.pdf: $(doc).tex urmathtest_cat.sty
	sed -e 's/TYPE/answersheet/' $(doc).tex > $(docpath)FullRespostes.tex
	$(LATEXMK) $(docpath)FullRespostes
	$(LATEXMK) $(docpath)FullRespostes
	cp $(doc)FullRespostes.pdf ../build

$(docpath)Respostes.pdf: $(doc).tex urmathtest_cat.sty
	sed -e 's/TYPE/answers/' $(doc).tex > $(docpath)Respostes.tex
	$(LATEXMK) $(docpath)Respostes
	cp $(doc)Respostes.pdf ../build

EX:
	@for name in E1 E2 E3 E4 E5 E6 E7 E8 E9 E10; do \
		FILE=proves_$$name; \
		cp $(HEADER_FOOTER_TEMPLATE) ../build/$$name.tex; \
		sed -i "s|EX_FILE|$$FILE|" ../build/$$name.tex; \
		sed -i "s|NAME_FILE|$$name|" ../build/$$name.tex; \
		$(LATEXMK) -output-directory=../build ../build/$$name.tex; \
	done

formulari: Formulari.tex ../Teoria/formules.tex $(COMMON_FILES)
	cp ../Teoria/formules.tex $(TMPFORM)
	sed -i "s|toprule|hline|" $(TMPFORM)
	sed -i "s|midrule|hline|" $(TMPFORM)
	sed -i "s|bottomrule|hline|" $(TMPFORM)
	sed -i "s|longtable|tabular|" $(TMPFORM)
	sed -i "s|\\\\caption|\%|" $(TMPFORM)
	sed -i "s|section|section\*|" $(TMPFORM)
	$(LATEXMK) -output-directory=../build Formulari.tex
	cp ../build/Formulari.pdf $(PDFDIR)

clean:
	rm -f *.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f $(docpath)*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
