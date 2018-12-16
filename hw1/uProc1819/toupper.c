#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/time.h>
#include "options.h"

#include <immintrin.h>
// #include "nmmintrin.h" // for SSE4.2
// #include "immintrin.h" // for AVX

//int gettimeofday(struct timeval *tv, struct timezone *tz);

int debug = 0;
double *results;
double *ratios;
unsigned long   *sizes;

int no_sz = 1, no_ratio =1, no_version=1;
int array_sz = 0;



static inline
double gettime(void) {

  struct timespec tp;
  clock_gettime(CLOCK_REALTIME, &tp);
  return (tp.tv_sec * 1000000000 + tp.tv_nsec) >> 10;

	// struct timeval TV;
	// struct timezone TZ;
  //
	// const int RC = gettimeofday(&TV, &TZ);
	// if (RC == -1) {
	// 	printf("ERROR: Bad call to gettimeofday\n");
	// 	return(-1);
	// }
  //
	// //return( ((double)TV.tv_sec) + kMicro * ((double)TV.tv_usec) );
	// return ((double)TV.tv_sec);
}

static void toupper_naive(char * text) {

  int i = 0;
  while(text[i] != '\0') {

    if(text[i] > 96 && *text < 123)
    {
      text[i] -= 32;
    }
    i++;
  }
}

////////////////////////////////////////////////////////////////////////////////////
// simple
////////////////////////////////////////////////////////////////////////////////////
static void toupper_simple(char * text) {
  for(int k = 0; k<array_sz; k++)
  {
    text[k] += (((96 - text[k]) & (text[k] - 123)) >> 7) & (-32);
  }
}

static void toupper_bytes(char * text)
{
  char lowLimit = 0x60;
  char highLimit = 0x7b;

  for(int i = 0; i<array_sz; i = i+1)
  {
    char lowMask = ( text[i] > lowLimit ) ? 0xFF : 0;
    char highMask = ( highLimit > text[i] ) ? 0xFF : 0;
    char modifier = 0x20;

    modifier = modifier & lowMask;
    modifier = modifier & highMask;

    text[i] = text[i] - modifier;
  }
}

static void toupper_intrinsics(char * text)
{

	__m256i chunk;

	//Load constants
	__m256i lowLimit = _mm256_set1_epi8 (0x60); //a-1
	__m256i highLimit = _mm256_set1_epi8 (0x7b); //z+1
  __m256i modifier = _mm256_set1_epi8 (0x20); //=32

	//for every 32 characters
	for(int i = 0; i < array_sz; i=i+32)
	{

		//fetch 32 characters from memory (265 bits)
		chunk = _mm256_loadu_si256 ((__m256i*)&(text[i]));

		//Compare characters with 'a-1': chunk > a-1 ?
    //store ones if bigger than 'a-1'
    __m256i lowMask = _mm256_cmpgt_epi8 (chunk, lowLimit);

		//Compare characters with 'z+1': z+1 > chunk ?
    //store ones if smaller than 'z+1'
    __m256i highMask = _mm256_cmpgt_epi8 (highLimit, chunk);

    //mask to 32 where it is a lower case
    lowMask = _mm256_and_si256 (modifier, lowMask);
    lowMask = _mm256_and_si256 (lowMask, highMask);

    //subtract
    chunk = _mm256_subs_epu8 (chunk, lowMask);

		//Store our 32 integers back to memory!
		_mm256_storeu_si256 ((__m256i*)&(text[i]), chunk);

	}
}

static void toupper_combined(char * text)
{

	__m256i chunk;

	//Load constants
	__m256i lowLimit = _mm256_set1_epi8 (0x60); //a-1
	__m256i highLimit = _mm256_set1_epi8 (0x7b); //z+1
  __m256i modifier = _mm256_set1_epi8 (0x20); //=32

	//for every 32 characters
  #pragma omp parallel for
	for(int i = 0; i < array_sz; i=i+32)
	{

		//fetch 32 characters from memory (265 bits)
		chunk = _mm256_loadu_si256 ((__m256i*)&(text[i]));

		//Compare characters with 'a-1': chunk > a-1 ?
    //store ones if bigger than 'a-1'
    __m256i lowMask = _mm256_cmpgt_epi8 (chunk, lowLimit);

		//Compare characters with 'z+1': z+1 > chunk ?
    //store ones if smaller than 'z+1'
    __m256i highMask = _mm256_cmpgt_epi8 (highLimit, chunk);

    //mask to 32 where it is a lower case
    lowMask = _mm256_and_si256 (modifier, lowMask);
    lowMask = _mm256_and_si256 (lowMask, highMask);

    //subtract
    chunk = _mm256_subs_epu8 (chunk, lowMask);

		//Store our 32 integers back to memory!
		_mm256_storeu_si256 ((__m256i*)&(text[i]), chunk);

	}
}

static void toupper_combined_1_thr(char * text)
{

	__m256i chunk;

	//Load constants
	__m256i lowLimit = _mm256_set1_epi8 (0x60); //a-1
	__m256i highLimit = _mm256_set1_epi8 (0x7b); //z+1
  __m256i modifier = _mm256_set1_epi8 (0x20); //=32

	//for every 32 characters
  #pragma omp parallel for num_threads(1)
	for(int i = 0; i < array_sz; i=i+32)
	{

		//fetch 32 characters from memory (265 bits)
		chunk = _mm256_loadu_si256 ((__m256i*)&(text[i]));

		//Compare characters with 'a-1': chunk > a-1 ?
    //store ones if bigger than 'a-1'
    __m256i lowMask = _mm256_cmpgt_epi8 (chunk, lowLimit);

		//Compare characters with 'z+1': z+1 > chunk ?
    //store ones if smaller than 'z+1'
    __m256i highMask = _mm256_cmpgt_epi8 (highLimit, chunk);

    //mask to 32 where it is a lower case
    lowMask = _mm256_and_si256 (modifier, lowMask);
    lowMask = _mm256_and_si256 (lowMask, highMask);

    //subtract
    chunk = _mm256_subs_epu8 (chunk, lowMask);

		//Store our 32 integers back to memory!
		_mm256_storeu_si256 ((__m256i*)&(text[i]), chunk);

	}
}

static void toupper_combined_2_thr(char * text)
{

	__m256i chunk;

	//Load constants
	__m256i lowLimit = _mm256_set1_epi8 (0x60); //a-1
	__m256i highLimit = _mm256_set1_epi8 (0x7b); //z+1
  __m256i modifier = _mm256_set1_epi8 (0x20); //=32

	//for every 32 characters
  #pragma omp parallel for num_threads(2)
	for(int i = 0; i < array_sz; i=i+32)
	{

		//fetch 32 characters from memory (265 bits)
		chunk = _mm256_loadu_si256 ((__m256i*)&(text[i]));

		//Compare characters with 'a-1': chunk > a-1 ?
    //store ones if bigger than 'a-1'
    __m256i lowMask = _mm256_cmpgt_epi8 (chunk, lowLimit);

		//Compare characters with 'z+1': z+1 > chunk ?
    //store ones if smaller than 'z+1'
    __m256i highMask = _mm256_cmpgt_epi8 (highLimit, chunk);

    //mask to 32 where it is a lower case
    lowMask = _mm256_and_si256 (modifier, lowMask);
    lowMask = _mm256_and_si256 (lowMask, highMask);

    //subtract
    chunk = _mm256_subs_epu8 (chunk, lowMask);

		//Store our 32 integers back to memory!
		_mm256_storeu_si256 ((__m256i*)&(text[i]), chunk);

	}
}

static void toupper_combined_4_thr(char * text)
{

	__m256i chunk;

	//Load constants
	__m256i lowLimit = _mm256_set1_epi8 (0x60); //a-1
	__m256i highLimit = _mm256_set1_epi8 (0x7b); //z+1
  __m256i modifier = _mm256_set1_epi8 (0x20); //=32

	//for every 32 characters
  #pragma omp parallel for num_threads(4)
	for(int i = 0; i < array_sz; i=i+32)
	{

		//fetch 32 characters from memory (265 bits)
		chunk = _mm256_loadu_si256 ((__m256i*)&(text[i]));

		//Compare characters with 'a-1': chunk > a-1 ?
    //store ones if bigger than 'a-1'
    __m256i lowMask = _mm256_cmpgt_epi8 (chunk, lowLimit);

		//Compare characters with 'z+1': z+1 > chunk ?
    //store ones if smaller than 'z+1'
    __m256i highMask = _mm256_cmpgt_epi8 (highLimit, chunk);

    //mask to 32 where it is a lower case
    lowMask = _mm256_and_si256 (modifier, lowMask);
    lowMask = _mm256_and_si256 (lowMask, highMask);

    //subtract
    chunk = _mm256_subs_epu8 (chunk, lowMask);

		//Store our 32 integers back to memory!
		_mm256_storeu_si256 ((__m256i*)&(text[i]), chunk);

	}
}

static void toupper_openmp(char * text)
{
    #pragma omp parallel for
    for(int k = 0; k<array_sz; k++)
    {
      // The main idea here was to eliminate the branch prediction here and
      // the unnecessary memory reads to the text array. The basic idea behind
      // the code is to do a bit manipulation: we only need to a minus calculation
      // when the read character is inside of the range of 96 and 123. The code works
      // by using the MSB - most significant bit - of the resulting combination in
      // logic operator:
      // Assume the element we have read is 'a' which is 97 in ASCII.
      // (96 - 97) & (97 - 123) = (-1) & (-26) = -26 in bitwise & operator. If you look
      // at the binary representation of -26, you can see that it's MSB is 1. We then do
      // do a shift arithmetic right operation with 7 - since chars are 8 bits - bits
      // to carry the MSB over all the bits of the number. And then (-26) & (-32) results
      // in (-32) hence we minus the value from the number.
      // If we have read an already capital element like 'A' which is 65 in ASCII:
      // (96 - 65) & (65 - 123) = (31) & (-58) = 6 with a 0 as MSB, then 0 & (-32) = 0
      // hence we do not need to substract from the character.
      text[k] += (((96 - text[k]) & (text[k] - 123)) >> 7) & (-32);
    }
}

static void toupper_openmp_1_thr(char * text)
{
    #pragma omp parallel for num_threads(1)
    for(int k = 0; k<array_sz; k++)
      text[k] += (((96 - text[k]) & (text[k] - 123)) >> 7) & (-32);
}

static void toupper_openmp_2_thr(char * text)
{
    #pragma omp parallel for num_threads(2)
    for(int k = 0; k<array_sz; k++)
      text[k] += (((96 - text[k]) & (text[k] - 123)) >> 7) & (-32);
}

static void toupper_openmp_4_thr(char * text)
{
    #pragma omp parallel for num_threads(4)
    for(int k = 0; k<array_sz; k++)
      text[k] += (((96 - text[k]) & (text[k] - 123)) >> 7) & (-32);
}

// inline assembly code
static void toupper_assembly(char * text) {
    int sub, i = 0;
    int bound = 0;
    int curr;
    while(text[i] != '\0')
    {
        curr = (int)text[i];
        __asm__ (
                 "cmp %%ebx, %%eax;"
                 "jg GREATER;"
                 "jmp REST;"
                 "GREATER: cmp %%eax, %%edx;"
                 "jg REST;"
                 "movl %1, %%edx;"
                 "jmp REST;"
                 "REST: "
                 : "=d" (bound) : "a" (curr) , "b" (96), "c" (123), "d" (0) );
        //if(debug) printf("Bound: for %d is  %d ...\n", text[i], bound);
        if(bound > 0)
        {
         //   if(debug) printf("optimization changes the value for %d", text[i]);
            __asm__ ( "subl %%ebx, %%eax;" : "=a" (text[i]) : "a" (curr) , "b" (32) );
        }
        __asm__ ( "addl %%ebx, %%eax;" : "=a" (i) : "a" (1), "b" (i) );
    }
}

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


    if(debug) printf("Before: %.40s...\n",text);

    start = gettime();
    (*f)(text);
    stop = gettime();
    results[index] = stop-start;

    if(debug) printf("After:  %.40s...\n",text);
}

struct _toupperversion {
    const char* name;
    toupperfunc func;
} toupperversion[] = {
    { "naive", toupper_naive },
    { "simple", toupper_simple },
    { "bytes", toupper_bytes },
    { "assembly", toupper_assembly },
    { "openMP", toupper_openmp },
    { "intrinsics", toupper_intrinsics },
    { "combined", toupper_combined },
    { "combined_1_thr", toupper_combined_1_thr },
    { "combined_2_thr", toupper_combined_2_thr },
    { "combined_4_thr", toupper_combined_4_thr },
    { "openMP_1_thr", toupper_openmp_1_thr },
    { "openMP_2_thr", toupper_openmp_2_thr },
    { "openMP_4_thr", toupper_openmp_4_thr },
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
     //omp_set_num_threads(2);

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
      {
        array_sz = sizes[i];
        run(i,j);
      }



		printresults();
    return 0;
}
