PROJECT=QuimAutomTheor

all:  ExamenParcial Exercise ${PROJECT}
ExamenParcial: build/ExamenParcial.pdf 
Exercise: build/Exercise.pdf 
test: build/test.pdf 
Theory: build/${PROJECT}.pdf 

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
	rm -f build/*

