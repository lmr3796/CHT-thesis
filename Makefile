BUILD_DIR?=build
BUILD_ENGINE?=xelatex
#COMPILE_CMD=latexmk -xelatex -outdir=$(BUILD_DIR)
PDF_TARGETS=main thesis
SLIDE_TARGETS=slide cht


.PHONY: clean clean-all clean-figures figures

all: $(PDF_TARGETS) $(SLIDE_TARGETS)

figures:
	cd figures && make

#$(TARGETS):
#	$(COMPILE_CMD) $@

$(PDF_TARGETS): $(BUILD_DIR) figures
	$(BUILD_ENGINE) -shell-escape -output-directory=$(BUILD_DIR) $@
	bibtex $(BUILD_DIR)/$@.aux
	$(BUILD_ENGINE) -shell-escape -output-directory=$(BUILD_DIR) $@
	$(BUILD_ENGINE) -shell-escape -output-directory=$(BUILD_DIR) $@
$(SLIDE_TARGETS): $(BUILD_DIR) figures
	$(BUILD_ENGINE) -shell-escape -output-directory=$(BUILD_DIR) $@
	biber --output_directory $(BUILD_DIR) $@
	$(BUILD_ENGINE) -shell-escape -output-directory=$(BUILD_DIR) $@
	$(BUILD_ENGINE) -shell-escape -output-directory=$(BUILD_DIR) $@
$(BUILD_DIR):
	mkdir -p $@
clean: clean-figures
	#$(COMPILE_CMD) -c
	rm -rf $(BUILD_DIR)/*
	#rm -rf *.log *.aux *.dvi *~ *.bbl  *.bl 1
	#rm -rf *.lo* *.toc *.blg

clean-figures:
	cd figures && make clean

#ICPADS:
#	latex   -output-directory=$(BUILD_DIR) ICPADS
#	bibtex  -output-directory=$(BUILD_DIR) ICPADS
#	latex	-output-directory=$(BUILD_DIR) ICPADS
#	latex	-output-directory=$(BUILD_DIR) ICPADS
#	dvipdfm $(BUILD_DIR)/ICPADS

