#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

static inline double gettime(void) {
  struct timespec tp;
  clock_gettime(CLOCK_REALTIME, &tp);
  return (tp.tv_sec * 1000000000 + tp.tv_nsec) >> 10;
}

char ** array_init(int array_size, int cache_line_len)
{
  char ** arr = malloc(sizeof(char*)*(array_size));
  for(int i = 0; i< array_size; i++)
  {
    arr[i] = malloc(sizeof(char)*(cache_line_len));
    arr[i][0] = rand()%256;
  }


  return arr;
}

int array_destroy(char ** destroyed_array, int array_size)
{
  for(int i = 0; i < array_size; i++)
    free(destroyed_array[i]);
  free(destroyed_array);

  return 0;
}

int * create_random_sequence(int num_elements)
{
  int * large_array = malloc(sizeof(int)*(2 * num_elements));
  for(int i = 0; i < 2 * num_elements; i++)
    large_array[i] = -1;

  int r = 0;
  int large_array_index = 0;
  for(int i = 0; i < num_elements; i++)
  {
    do {
      r = rand()%(2 * num_elements);
    } while (large_array[r] != -1 );
    large_array[r] = large_array_index++;
  }

  int * random_order_array = malloc(sizeof(int)*(num_elements));
  int random_order_array_index = 0;
  for(int i = 0; i < 2 * num_elements; i++)
  {
    if(large_array[i] != -1)
      random_order_array[random_order_array_index++] = large_array[i];
  }

  free(large_array);
  return random_order_array;
}

int main(int argc, char ** argv)
{
  int cache_line_length = 128;
  int array_sz_min = 10;
  int array_sz_max = 1000;
  int array_sz_step = 10;
  int repeat = 32;
  int total_steps = array_sz_max * 100;
  // PARAMS
  //
  // cache_line_length
  // array_sz_min
  // array_sz_max
  // array_sz_step
  // repeat
  // total_steps

  if(argc > 2)
  {
    cache_line_length = atoi(argv[1]);
    array_sz_min = atoi(argv[2]);
    array_sz_max = atoi(argv[3]);
    array_sz_step = atoi(argv[4]);
    repeat = atoi(argv[5]);
    total_steps = atoi(argv[6]);
  }

  int arr_sum;
  double start_time, stop_time, abs_time, avg_time;



  //loop over strides = N
  for(int curr_array_sz = array_sz_min; curr_array_sz < array_sz_max; curr_array_sz += array_sz_step)
  {
    avg_time = 0;

    for(int j = 0; j < repeat; j++)
    {
        //random order
        int * random_order_array = create_random_sequence(curr_array_sz);

        char ** array = array_init(curr_array_sz, cache_line_length);
        arr_sum = 0;

        start_time = gettime();
        //access elems of array with stride i
        for(int k = 0; k < total_steps; k++)
          arr_sum += array[random_order_array[k%curr_array_sz]][0];

        stop_time = gettime();

        abs_time = stop_time - start_time;
        avg_time += abs_time;

        free(random_order_array);
        array_destroy(array, curr_array_sz);
    }
    avg_time = avg_time / repeat;
    printf("array_size: %d time: %f \n", curr_array_sz, avg_time);

  }

  return 0;
}
