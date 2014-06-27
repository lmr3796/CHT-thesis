paper:
	latex paper
	bibtex paper
	#cp bblref paper.bbl
	latex paper
	latex paper
	dvipdfm paper

clean:
	rm -rf *.log *.aux *.dvi *~ *.bbl  *.bl 1
	rm -rf *.lo* *.toc *.blg
