BUILD_DIR?=build/
COMPILE_CMD=latexmk -xelatex -outdir=$(BUILD_DIR)
TARGETS=main thesis 


.PHONY: clean
$(TARGETS):
	$(COMPILE_CMD) $@
all: $(TARGETS)
clean:
	$(COMPILE_CMD) -c

