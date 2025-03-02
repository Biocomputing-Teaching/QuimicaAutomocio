SHELL := /bin/bash

PROJECT = Exercise
PDFDIR = ../../../Web/WebQuimicaAutomocio/docs/pdf/
LATEX_FILES = *.tex 
LATEXMK = latexmk -pdf #-quiet
HEADER_FOOTER_TEMPLATE = header_footer_template_exercicis.tex

# Objectius 
all: ../build/${PROJECT}.pdf

# Regles per generar el PDF del projecte principal
../build/${PROJECT}.pdf: ${LATEX_FILES} Exercise.tex
	$(LATEXMK) ${PROJECT}.tex
	mv ${PROJECT}.pdf ../build/
	rsync --update ../build/${PROJECT}.pdf ${PDFDIR}

# 	@for name in Gasos Combustio ForcesInt Piles Llum Materials Temperatura; do \

files:
	@for name in Gasos Combustio; do \
		FILE=autoavaluacio_GEA$$name; \
		cp $(HEADER_FOOTER_TEMPLATE) ../build/temp_header_footer_$$name.tex; \
		sed -i "s|AUTOAV_FILE|$$FILE|" ../build/temp_header_footer_$$name.tex; \
		sed -i "s|NAME_FILE|$$name|g" ../build/temp_header_footer_$$name.tex; \
		$(LATEXMK) -output-directory=../build ../build/temp_header_footer_$$name.tex; \
		rsync --update ../build/temp_header_footer_$$name.pdf ${PDFDIR}/$$FILE.pdf; \
	done


# Netejar fitxers temporals generats durant la compilació
clean:
	rm -f *.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f ../build/*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -rf ../build/temp*
	latexmk -C

