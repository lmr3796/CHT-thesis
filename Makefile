BUILD_DIR?=build/
COMPILE_CMD=latexmk -xelatex -outdir=$(BUILD_DIR)
TARGETS=thesis main


.PHONY: clean
all: $(TARGETS)
$(TARGETS):
	$(COMPILE_CMD) $@
clean:
	$(COMPILE_CMD) -c

