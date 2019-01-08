#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>


char * array;

static inline
double gettime(void) {

  struct timespec tp;
  clock_gettime(CLOCK_REALTIME, &tp);
  return (tp.tv_sec * 1000000000 + tp.tv_nsec) >> 10;
}

int array_init(int array_size)
{
  array = malloc(sizeof(char)*(array_size + 32));
  for(int i = 0; i< array_size; i++)
    array[i] = rand()%256;
  array[array_size] = '\0';

  return 0;
}

int main(int argc, char** argv)
{
  //init vars
  int array_sz = 1024 * 8192;
  int stride_min = 1;
  int stride_max = 2500;
  int stride_step = 25;


  if(array_init(array_sz))
  {
    printf("Error init array.\n");
    return 1;
  }

  //printf("arrray:  %d %d %d %d \n", array[0], array[1], array[1024], array[1023]);

  int arr_sum, remaining_steps;
  double start_time, stop_time, abs_time;
  int total_steps = array_sz / stride_max;

  printf("array_sz %d total_steps: %d \n", array_sz, total_steps);
  //loop over strides
  for(int curr_stride = stride_min; curr_stride < stride_max; curr_stride += stride_step)
  {
    remaining_steps = total_steps;
    arr_sum = 0;

    start_time = gettime();
    //access elems of array with stride i
    for(int k = 0; k < array_sz; k += curr_stride)
    {
      arr_sum += array[k];
      if(--remaining_steps == 0)
        break;
    }
    stop_time = gettime();

    abs_time = stop_time - start_time;
    printf("stride: %d, time: %f \n", curr_stride, abs_time);


  }

  return 0;
}
