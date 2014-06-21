BUILD_DIR?=build
#COMPILE_CMD=latexmk -xelatex -outdir=$(BUILD_DIR)
PDF_TARGETS=main thesis
SLIDE_TARGETS=slide cht


.PHONY: clean clean-all
	#$(TARGETS):
	#	$(COMPILE_CMD) $@
$(PDF_TARGETS):
	xelatex -output-directory=$(BUILD_DIR) $@
	bibtex $(BUILD_DIR)/$@.aux
	xelatex -output-directory=$(BUILD_DIR) $@
	xelatex -output-directory=$(BUILD_DIR) $@
$(SLIDE_TARGETS):
	xelatex -output-directory=$(BUILD_DIR) $@
	biber --output_directory $(BUILD_DIR) $@
	xelatex -output-directory=$(BUILD_DIR) $@
	xelatex -output-directory=$(BUILD_DIR) $@
all: $(PDF_TARGETS) $(SLIDE_TARGETS)
clean:
	#$(COMPILE_CMD) -c
	rm -rf $(BUILD_DIR)/*

