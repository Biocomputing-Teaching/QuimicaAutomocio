SHELL := /bin/bash
PROJECT=QuimAutomTheor

all:  ExamenParcial Exercise ${PROJECT} clean
ExamenParcial: build/ExamenParcial.pdf clean
Exercise: build/Exercise.pdf clean
test: build/test.pdf clean
Theory: build/${PROJECT}.pdf clean 

build/ExamenParcial.pdf: ExamenParcial.tex
	lualatex --output-directory=build ExamenParcial
	lualatex --output-directory=build ExamenParcial

build/Exercise.pdf: Exercise.tex
	lualatex --output-directory=build Exercise
	lualatex --output-directory=build Exercise

build/test.pdf: test.tex
	lualatex --output-directory=build test
	lualatex --output-directory=build test

build/${PROJECT}.pdf: build/${PROJECT}.bbl
	lualatex --output-directory=build ${PROJECT}
	lualatex --output-directory=build ${PROJECT}

build/${PROJECT}.bbl: build/${PROJECT}.bcf
	biber build/${PROJECT}

build/${PROJECT}.bcf: ${PROJECT}.tex
	lualatex --output-directory=build ${PROJECT}

clean:
	rm -f *.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}
	rm -f build/*.{bcf,run.xml,pro,aux,nav,out,log,idx,ind,ilg,toc,bbl,blg,tdo,lot,lof,glo,snm}


