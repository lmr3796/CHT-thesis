.PHONY: clean
figures: hetero.eps homo.eps
homo.eps: homo.dat
	./plot-homo.gpi
hetero.eps: hetero.dat
	./plot-hetero.gpi
clean:
	rm -f homo.eps hetero.eps
