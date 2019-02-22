#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/time.h>
#include <immintrin.h>
#include "options.h"

//int gettimeofday(struct timeval *tv, struct timezone *tz);

int debug = 0;
double *results;
double *ratios;
unsigned long   *sizes;

int no_sz = 1, no_ratio =1, no_version=1;



static inline
double gettime(void) {
  struct timespec tp;
  clock_gettime(CLOCK_REALTIME, &tp);
  return tp.tv_nsec/1000;
}


static void toupper_simple(char * text) {
  // to be implemented
    int i = 0;
    while(text[i] != '\0')
    {
        if(text[i] > 96 && text[i] < 123)
        {
         //   if(debug) printf("simple method changes text");
            text[i] -= 32;
        }
        i++;
    }
}

// inline assembly code ARM
static void toupper_optimised(char * text) {
    int sub, i = 0;
    int bound = 0;
    int curr;
    int r0;
    int r1;
    while(text[i] != '\0')
    {
        curr = (int)text[i];
        __asm (
                 "mov r0, %[value];"
                 "cmp r0, #96;"
                 "bl REST;"
                 "cmp r0, #123;"
                 "sublt r0, r0, #32;"
                 "REST: "
                 "mov %[result], r0;"
          : [result] "=d" (bound) : [value] "a" (curr));
        text[i] = bound;
        i++;
    }
}

// inline assembly code MIPS
static void toupper_optimised(char * text) {
    int sub, i = 0;
    int bound = 0;
    int curr;
    int s0;
    int s1;
    while(text[i] != '\0')
    {
        curr = (int)text[i];
        __asm (
               "addi $s0, %[value], %0;"
               "sub $s1 $s0, 96"
               "blez $s1 REST;"
               "sub $s2 $s0, 123"
               "bgtz $s2, REST;"
               "addi $s0, $s0, -32;"
               "REST: "
               "addi %[result], $s0, %0;"
               : [result] "=m" (bound) : [value] : "=r" (curr));
        text[i] = bound;
        i++;
    }
}

/*****************************************************************/


// align at 16byte boundaries
void* mymalloc(unsigned long int size)
{
     void* addr = malloc(size+32);
     return (void*)((unsigned long int)addr /16*16+16);
}

char createChar(int ratio){
	char isLower = rand()%100;

	// upper case=0, lower case=1
	if(isLower < ratio)
		isLower =0;
	else
		isLower = 1;

	char letter = rand()%26+1; // a,A=1; b,B=2; ...

	return 0x40 + isLower*0x20 + letter;

}

char * init(unsigned long int sz, int ratio){
    int i=0;
    char *text = (char *) mymalloc(sz+1);
    srand(1);// ensures that all strings are identical
    for(i=0;i<sz;i++){
			char c = createChar(ratio);
			text[i]=c;
	  }
    text[i] = '\0';
    return text;
}



/*
 * ******************* Run the different versions **************
 */

typedef void (*toupperfunc)(char *text);

void run_toupper(int size, int ratio, int version, toupperfunc f, const char* name)
{
   double start, stop;
		int index;

		index =  ratio;
		index += size*no_ratio;
		index += version*no_sz*no_ratio;

    char *text = init(sizes[size], ratios[ratio]);


    if(debug) printf("Before: %0.4s...\n",text);

    start = gettime();
    if(debug) printf("Start Time: %f...\n",start);
    (*f)(text);
    stop = gettime();
    if(debug) printf("Stop Time: %f...\n",stop);
    results[index] = stop-start;
    if(debug) printf("Total Time: %f...\n",results[index]);
    
    if(debug) printf("After:  %0.4s...\n",text);
}

struct _toupperversion {
    const char* name;
    toupperfunc func;
} toupperversion[] = {
    { "simple",    toupper_simple },
    { "optimised", toupper_optimised },
    { 0,0 }
};


void run(int size, int ratio)
{
	int v;
	for(v=0; toupperversion[v].func !=0; v++) {
		run_toupper(size, ratio, v, toupperversion[v].func, toupperversion[v].name);
	}
}

void printresults(){
	int i,j,k,index;
	printf("%s\n", OPTS);

	for(j=0;j<no_sz;j++){
		for(k=0;k<no_ratio;k++){
			printf("Size: %ld \tRatio: %f \tRunning time:", sizes[j], ratios[k]);
			for(i=0;i<no_version;i++){
				index =  k;
				index += j*no_ratio;
				index += i*no_sz*no_ratio;
				printf("\t%s: %f", toupperversion[i].name, results[index]);
			}
			printf("\n");
		}
	}
}

int main(int argc, char* argv[])
{
    unsigned long int min_sz=800000, max_sz = 0, step_sz = 10000;
		int min_ratio=50, max_ratio = 0, step_ratio = 1;
		int arg,i,j,v;
		int no_exp;

		for(arg = 1;arg<argc;arg++){
			if(0==strcmp("-d",argv[arg])){
				debug = 1;
			}
			if(0==strcmp("-l",argv[arg])){
					min_sz = atoi(argv[arg+1]);
					if(arg+2>=argc) break;
					if(0==strcmp("-r",argv[arg+2])) break;
					if(0==strcmp("-d",argv[arg+2])) break;
					max_sz = atoi(argv[arg+2]);
					step_sz = atoi(argv[arg+3]);
			}
			if(0==strcmp("-r",argv[arg])){
					min_ratio = atoi(argv[arg+1]);
					if(arg+2>=argc) break;
					if(0==strcmp("-l",argv[arg+2])) break;
					if(0==strcmp("-d",argv[arg+2])) break;
					max_ratio = atoi(argv[arg+2]);
					step_ratio = atoi(argv[arg+3]);
			}

		}
    for(v=0; toupperversion[v].func !=0; v++)
		no_version=v+1;
		if(0==max_sz)  no_sz =1;
		else no_sz = (max_sz-min_sz)/step_sz+1;
		if(0==max_ratio)  no_ratio =1;
		else no_ratio = (max_ratio-min_ratio)/step_ratio+1;
		no_exp = v*no_sz*no_ratio;
		results = (double *)malloc(sizeof(double[no_exp]));
		ratios = (double *)malloc(sizeof(double[no_ratio]));
		sizes = (long *)malloc(sizeof(long[no_sz]));

		for(i=0;i<no_sz;i++)
			sizes[i] = min_sz + i*step_sz;
		for(i=0;i<no_ratio;i++)
			ratios[i] = min_ratio + i*step_ratio;

		for(i=0;i<no_sz;i++)
			for(j=0;j<no_ratio;j++)
				run(i,j);

		printresults();
    return 0;
}
