
sources = main.c
.PHONY:all
all: compile run plot

compile:
	/usr/local/Cellar/gcc/8.2.0/bin/gcc-8 -lm -march=native -O0 main.c -S -o main.s
	/usr/local/Cellar/gcc/8.2.0/bin/gcc-8 -lm -march=native -O0 main.c -o main

run:
	./main 16000000 1 10000 100 32 > results/results1
	@echo ""
	cat results/results1
	./main 16000000 1 1000 10 64 > results/results2
	@echo ""
	cat results/results2
	./main 16000000 1 500 5 64 > results/results3
	@echo ""
	cat results/results3
	./main 16000000 30 250 3 128 > results/results4
	@echo ""
	cat results/results4
	./main 16000000 100 150 1 128 > results/results5
	@echo ""
	cat results/results5

plot:
	cd results && gnuplot gnuplot_scripts_2.txt && cd ..
