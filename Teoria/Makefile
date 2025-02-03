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
Exercise: ../build/Exercise.pdf
Theory: ${PROJECT}.pdf 

# Generar PDFs per a cada fitxer GEA
GEA_pdfs:
	@for file in $(wildcard GEA*.tex); do \
		# Crear un fitxer temporal amb el contingut complet, incloent encapçalament i peu de pàgina \
		cp $(HEADER_FOOTER_TEMPLATE) temp_header_footer.tex; \
		# Substituir \input{GEA_FILE.tex} pel nom del fitxer específic utilitzant sed \
		sed "s|\\input{GEA_FILE.tex}|\\input{$$file}|" temp_header_footer.tex > temp_header_footer_modified.tex; \
		# Compilar el fitxer resultant amb latexmk \
		latexmk -pdf -output-directory=../build temp_header_footer_modified.tex; \
		# Moure el PDF generat al directori de destí \
		mv ../build/temp_header_footer_modified.pdf ${PDFDIR}/$$file.pdf; \
		# Netejar els fitxers temporals \
		rm -f temp_header_footer.tex temp_header_footer_modified.tex; \
	done

# Regles per generar el PDF d'ExamenParcial
../build/ExamenParcial.pdf: ExamenParcial.tex
	$(LATEXMK) -output-directory=../build ExamenParcial.tex

# Regles per generar el PDF d'Exercise
../build/Exercise.pdf: Exercise.tex
	$(LATEXMK) -output-directory=../build Exercise.tex

# Regles per generar el PDF del projecte principal
${PROJECT}.pdf: ${LATEX_FILES}
	$(LATEXMK) ${PROJECT}.tex
	rsync --update ${PROJECT}.pdf ${PDFDIR}

# Regles per generar el PDF del projecte principal
${TABLE}.pdf: ${TABLE}.tex
	$(LATEXMK) ${TABLE}.tex
	rsync --update ${TABLE}.pdf ${PDFDIR}

# Netejar fitxers temporals generats durant la compilació
clean:
	rm -f *.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f ../build/*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
