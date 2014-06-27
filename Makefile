BUILD_DIR?=build
BUILD_ENGINE?=xelatex
#COMPILE_CMD=latexmk -xelatex -outdir=$(BUILD_DIR)
PDF_TARGETS=main thesis
SLIDE_TARGETS=slide cht


.PHONY: clean clean-all

all: $(PDF_TARGETS) $(SLIDE_TARGETS)

#$(TARGETS):
#	$(COMPILE_CMD) $@

$(PDF_TARGETS): $(BUILD_DIR)
	$(BUILD_ENGINE) -output-directory=$(BUILD_DIR) $@
	bibtex $(BUILD_DIR)/$@.aux
	$(BUILD_ENGINE) -output-directory=$(BUILD_DIR) $@
	$(BUILD_ENGINE) -output-directory=$(BUILD_DIR) $@
$(SLIDE_TARGETS): $(BUILD_DIR)
	$(BUILD_ENGINE) -output-directory=$(BUILD_DIR) $@
	biber --output_directory $(BUILD_DIR) $@
	$(BUILD_ENGINE) -output-directory=$(BUILD_DIR) $@
	$(BUILD_ENGINE) -output-directory=$(BUILD_DIR) $@
$(BUILD_DIR):
	mkdir -p $@
clean:
	#$(COMPILE_CMD) -c
	rm -rf $(BUILD_DIR)/*

