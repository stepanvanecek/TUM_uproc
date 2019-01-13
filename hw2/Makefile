
sources = cache_line_length.c
.PHONY:ex1_all
ex1_all: ex1_compile ex1_run

.PHONY:ex2_all
ex2_all: ex2_compile ex2_run

.PHONY:all
all: ex1_all ex2_all plot

ex1_compile:
	/usr/local/Cellar/gcc/8.2.0/bin/gcc-8 -lm -march=native -O0 cache_line_length.c -S -o cache_line_length.s
	/usr/local/Cellar/gcc/8.2.0/bin/gcc-8 -lm -march=native -O0 cache_line_length.c -o cache_line_length

ex1_run:
	@date
	./cache_line_length 16000000 1 10000 100 32 > results/ex1-results1
	@echo "ex1 run1 completed"
	@#cat results/ex1-results1
	@echo ""

	@date
	./cache_line_length 16000000 1 1000 10 64 > results/ex1-results2
	@echo "ex1 run2 completed"
	@#cat results/ex1-results2
	@echo ""

	@date
	./cache_line_length 16000000 1 500 5 64 > results/ex1-results3
	@echo "ex1 run3 completed"
	@#cat results/ex1-results3
	@echo ""

	@date
	./cache_line_length 16000000 50 250 2 256 > results/ex1-results4
	@echo "ex1 run4 completed"
	@#cat results/ex1-results4
	@echo ""

	@date
	./cache_line_length 16000000 100 150 1 512 > results/ex1-results5
	@echo "ex1 run5 completed"
	@#cat results/ex1-results5
	@echo ""

	@date
	@echo ""

plot:
	cd results && gnuplot gnuplot_scripts_2.txt && cd ..

ex2_compile:
	/usr/local/Cellar/gcc/8.2.0/bin/gcc-8 -lm -march=native -O0 cache_sizes.c -S -o cache_sizes.s
	/usr/local/Cellar/gcc/8.2.0/bin/gcc-8 -lm -march=native -O0 cache_sizes.c -o cache_sizes

ex2_run:
	@date
	#0 - 1000
	./cache_sizes 128 10 1000 10 128 1000000 > results/ex2-results1
	@echo "ex2 run1 completed"
	@#cat results/ex2-results1
	@echo ""

	@date
	#0 - 5000
	./cache_sizes 128 50 5000 50 128 1000000 > results/ex2-results2
	@echo "ex2 run2 completed"
	@#cat results/ex2-results2
	@echo ""

	@date
	#0 - 40000
	./cache_sizes 128 1000 100000 1000 256 1000000 > results/ex2-results3
	@echo "ex2 run3 completed"
	@#cat results/ex2-results3
	@echo ""

	@date
	#0 - 1000
	./cache_sizes 64 20 2000 20 128 1000000 > results/ex2-results4
	@echo "ex2 run4 completed"
	@#cat results/ex2-results1
	@echo ""

	@date
	#0 - 5000
	./cache_sizes 64 100 10000 100 128 1000000 > results/ex2-results5
	@echo "ex2 run5 completed"
	@#cat results/ex2-results2
	@echo ""

	@date
	#0 - 40000
	./cache_sizes 64 1000 100000 1000 256 1000000 > results/ex2-results6
	@echo "ex2 run6 completed"
	@#cat results/ex2-results3
	@echo ""
	@date
	
