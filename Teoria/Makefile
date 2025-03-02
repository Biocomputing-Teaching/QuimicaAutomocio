SHELL := /bin/bash

PROJECT = QuimAutomTheor
TABLE = TaulaUnitats

PDFDIR = ../../../Web/WebQuimicaAutomocio/docs/pdf/
FILES = GEAGasos GEACombustio
LATEX_FILES = ${PROJECT}.tex $(wildcard GEA*.tex)
HEADER_FOOTER_TEMPLATE = header_footer_template.tex
COMMON_FILES = $(wildcard ../common/*.tex)

LATEXMK = latexmk -pdf #-quiet

all: ExamenParcial Exercise Theory move clean generate_GEA_pdfs
Taula: ${TABLE}.pdf
ExamenParcial: ../build/ExamenParcial.pdf
Theory: ../build/${PROJECT}.pdf 

files:
	@counter=-1; \
	for file in $(FILES); do \
		needs_update=0; \
		counter=$$((counter + 1)); \
		output_pdf=${PDFDIR}/$$file.pdf; \
		echo "########\n# evaluating work to be done for $$file.tex:\n#######"; \
		if [ -f $$file.tex ] && [ $$file.tex -nt $$output_pdf ]; then needs_update=1; fi; \
		if [ $(HEADER_FOOTER_TEMPLATE) -nt $$output_pdf ]; then needs_update=1; fi; \
		if [ ../Exercicis/compendi_$$file.tex -nt $$output_pdf ]; then needs_update=1; fi; \
		for common in $(COMMON_FILES); do \
			if [ $$common -nt $$output_pdf ]; then needs_update=1; fi; \
		done; \
		if [ $$needs_update -eq 1 ]; then \
			cp $$file.tex ../build/$$file.mod; \
			sed -i "s/marginnote/footnote/" ../build/$$file.mod; \
			sed -i "s/marginfigure/figure/" ../build/$$file.mod; \
			sed -i "s/margintable/table/" ../build/$$file.mod; \
			sed -i "s/\\chapter/\\%\\chapter\*/" ../build/$$file.mod; \
			cp $(HEADER_FOOTER_TEMPLATE) ../build/temp_$$file.tex; \
			sed -i "s|GEA_EXERCISES|$$file|" ../build/temp_$$file.tex; \
			sed -i "s|NUM_CAPITOL|$$counter|" ../build/temp_$$file.tex; \
			sed -i "s|GEA_FILE|$$file.mod|" ../build/temp_$$file.tex; \
			$(LATEXMK) -output-directory=../build ../build/temp_$$file.tex; \
			rsync --update ../build/temp.pdf $$output_pdf; \
		fi; \
	done

../build/${PROJECT}.pdf: 
	@cp $(PROJECT).tex ../build/; \
	output_pdf=../build/$(PROJECT).pdf; \
	needs_update=0; \
	for file in $(FILES); do \
		echo $$file; \
		if [ -f $$file.tex ] && [ $$file.tex -nt $$output_pdf ]; then needs_update=1; fi; \
		if [ -f $(PROJECT).tex ] && [ $(PROJECT).tex -nt $$output_pdf ]; then needs_update=1; fi; \
		for common in $(COMMON_FILES); do \
			if [ $$common -nt $$output_pdf ]; then needs_update=1; fi; \
		done; \
		echo "need update: $$needs_update"; \
		if [ $$needs_update -eq 1 ]; then \
			cp $$file.tex ../build/; \
			sed -i "s/\\\\tableofcontents/\\%/" ../build/$$file.tex; \
		fi; \
	done; \
	if [ $$needs_update -eq 1 ]; then \
		$(LATEXMK) -output-directory=../build ../build/$(PROJECT).tex; \
		rsync --update ../build/${PROJECT}.pdf ${PDFDIR}; \
	else \
		echo "nothing to update";\
	fi

../build/ExamenParcial.pdf: ExamenParcial.tex ${COMMON_FILES}
	$(LATEXMK) -output-directory=../build ExamenParcial.tex

${TABLE}.pdf: ${TABLE}.tex ${COMMON_FILES} formulari.tex
	$(LATEXMK) ${TABLE}.tex
	rsync --update ${TABLE}.pdf ${PDFDIR}

clean:
	rm -f *.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f ../build/*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f temp*
	latexmk -C

cleanpdf:
	rm -rf ../build/QuimAutomTheor.pdf
