SHELL := /bin/bash

PROJECT = QuimAutomTheor
TABLE = TaulaUnitats

# Directori de destinació per als PDFs generats
PDFDIR = ../../../Web/WebQuimicaAutomocio/docs/pdf/

# Fitxers de dependències
LATEX_FILES = ${PROJECT}.tex common.tex $(wildcard GEA*.tex)

# Fitxers base per a cada GEA (els fitxers amb encapçalament i peu de pàgina)
HEADER_FOOTER_TEMPLATE = header_footer_template.tex

# Comandes per a la compilació
LATEXMK = latexmk -pdf #-quiet

# Objectius 
all: ExamenParcial Exercise Theory move clean generate_GEA_pdfs
Taula: ${TABLE}.pdf
ExamenParcial: ../build/ExamenParcial.pdf
Theory: ../build/${PROJECT}.pdf 

# Generar PDFs per a cada fitxer GEA
# GEA_pdfs:
# 	@for file in $(wildcard GEA*.tex); do \
# 		cp $(HEADER_FOOTER_TEMPLATE) temp_header_footer.tex; \
# 		sed "s|\\input{GEA_FILE.tex}|\\input{$$file}|" temp_header_footer.tex > temp_header_footer_modified.tex; \
# 		sed "s|\\marginnote|\\footnote|" temp_header_footer_modified.tex >kk.tex; \
# 		exit(1);\
# 		latexmk -pdf -output-directory=../build temp_header_footer_modified.tex; \
# 		mv ../build/temp_header_footer_modified.pdf ${PDFDIR}/$$file.pdf; \
# 		rm -f temp_header_footer.tex temp_header_footer_modified.tex; \
# 	done

files:
	@for file in $(wildcard GEA*.tex); do \
		cp $(HEADER_FOOTER_TEMPLATE) temp_header_footer.tex; \
		cp $$file $$file.mod; \
		sed -i "s/marginnote/footnote/" $$file.mod; \
		sed -i "s/marginfigure/figure/" $$file.mod; \
		sed -i "s/margintable/table/" $$file.mod; \
		sed -i "s/chapter/chapter\*/" $$file.mod; \
		sed "s|\\input{GEA_FILE.tex}|\\input{$$file.mod}|" temp_header_footer.tex > temp_header_footer_modified.tex; \
		$(LATEXMK) -output-directory=../build temp_header_footer_modified.tex; \
		rsync --update ../build/temp_header_footer_modified.pdf ${PDFDIR}/$$(basename $$file .tex).pdf; \
	done

# Regles per generar el PDF d'ExamenParcial
../build/ExamenParcial.pdf: ExamenParcial.tex
	$(LATEXMK) -output-directory=../build ExamenParcial.tex

# Regles per generar el PDF del projecte principal
../build/${PROJECT}.pdf: ${LATEX_FILES}
	$(LATEXMK) -output-directory=../build ${PROJECT}.tex
	rsync --update ../build/${PROJECT}.pdf ${PDFDIR}

# Regles per generar el PDF del projecte principal
${TABLE}.pdf: ${TABLE}.tex
	$(LATEXMK) ${TABLE}.tex
	rsync --update ${TABLE}.pdf ${PDFDIR}

# Netejar fitxers temporals generats durant la compilació
clean:
	rm -f *.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f ../build/*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f temp*

