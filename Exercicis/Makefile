SHELL := /bin/bash

PROJECT = Exercise
PDFDIR = ../../../Web/WebQuimicaAutomocio/docs/pdf/
LATEX_FILES = *.tex 
LATEXMK = latexmk -pdf #-quiet

# Objectius 
all: ../build/${PROJECT}.pdf

# Regles per generar el PDF del projecte principal
../build/${PROJECT}.pdf: ${LATEX_FILES}
	$(LATEXMK) ${PROJECT}.tex
	mv ${PROJECT}.pdf ../build/
	rsync --update ../build/${PROJECT}.pdf ${PDFDIR}

# Netejar fitxers temporals generats durant la compilació
clean:
	rm -f *.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f ../build/*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}

