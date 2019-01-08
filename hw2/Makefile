
sources = main.c
.PHONY:all
all:
	/usr/local/Cellar/gcc/8.2.0/bin/gcc-8 -fopenmp -lm -march=native -O0 main.c -S -o main.s
	/usr/local/Cellar/gcc/8.2.0/bin/gcc-8 -fopenmp -lm -march=native -O0 main.c -o main

	./main
	@echo ""
