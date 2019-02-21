#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>


char * array;

//init vars
int array_sz = 1024 * 16384;
int stride_min = 1;
int stride_max = 600;
int stride_step = 5;
int repeat = 32;

char * flush_array;
int flush_array_sz = 10 << 20;


static inline
double gettime(void) {

  struct timespec tp;
  clock_gettime(CLOCK_REALTIME, &tp);
  return (tp.tv_sec * 1000000000 + tp.tv_nsec) >> 10;
}

char * array_init(int array_size)
{
  char * arr = malloc(sizeof(char)*(array_size + 32));
  for(int i = 0; i< array_size; i++)
    arr[i] = rand()%256;
  arr[array_size] = '\0';

  return arr;
}


int main(int argc, char** argv)
{
  // PARAMS
  //
  // array_size
  // stride_min
  // stride_max
  // stride_step
  // repeat

  if(argc > 2)
  {
    array_sz = atoi(argv[1]);
    stride_min = atoi(argv[2]);
    stride_max = atoi(argv[3]);
    stride_step = atoi(argv[4]);
    repeat = atoi(argv[5]);
  }

  array = array_init(array_sz);
  flush_array = array_init(flush_array_sz);

  int arr_sum, index;
  double start_time, stop_time, abs_time, avg_time;
  int total_steps = array_sz / stride_max;

  //loop over strides
  for(int curr_stride = stride_min; curr_stride < stride_max; curr_stride += stride_step)
  {
    avg_time = 0;

    for(int j = 0; j < repeat; j++)
    {
      arr_sum = 0;
      index = 0;

      start_time = gettime();
      //access elems of array with stride i
      for(int k = 0; k < total_steps; k++)
      {
        arr_sum += array[index];
        index += curr_stride;
      }
      stop_time = gettime();

      abs_time = stop_time - start_time;
      avg_time += abs_time;

      //flush data in the cache by loading another array
      //do not to access each element, just need to load each cache line
      for(int k = 0; k < flush_array_sz; k += 8)
        arr_sum += flush_array[k];
    }
    avg_time = avg_time / repeat;

    printf("stride: %d time: %f \n", curr_stride, avg_time);


  }

  free(array);
  free(flush_array);
  return 0;
}
