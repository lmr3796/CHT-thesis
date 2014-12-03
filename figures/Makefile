.PHONY: figures clean
EPS_FIGURES=hetero-penalty.eps homo-penalty.eps hetero-violation.eps homo-violation.eps

figures: $(EPS_FIGURES)

$(EPS_FIGURES): %.eps: %.dat
	./plot-$(<:.dat=).gpi
clean:
	\rm -f $(EPS_FIGURES)
