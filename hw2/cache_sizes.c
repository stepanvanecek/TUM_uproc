#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

static inline double gettime(void) {
  struct timespec tp;
  clock_gettime(CLOCK_REALTIME, &tp);
  return (tp.tv_sec * 1000000000 + tp.tv_nsec) >> 10;
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

int ** array_init(int array_size, int cache_line_len)
{
  int ** arr = malloc(sizeof(int*)*(array_size));
  for(int i = 0; i< array_size; i++)
    arr[i] = malloc(cache_line_len);

  int * random_sequence = create_random_sequence(array_size);

  int curr_index = random_sequence[array_size-1];
  for(int i = 0; i< array_size; i++)
  {
    arr[curr_index][0] = random_sequence[i];
    curr_index = random_sequence[i];
  }

  free(random_sequence);
  return arr;
}

int array_destroy(int ** destroyed_array, int array_size)
{
  for(int i = 0; i < array_size; i++)
    free(destroyed_array[i]);
  free(destroyed_array);

  return 0;
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

  int next_index;
  double start_time, stop_time, abs_time, avg_time;

  // int ** array = array_init(12, 128);
  // for(int i = 0; i<12; i++)
  //   printf("%d ", array[i][0]);


  //loop over strides = N
  for(int curr_array_sz = array_sz_min; curr_array_sz < array_sz_max; curr_array_sz += array_sz_step)
  {
    avg_time = 0;

    for(int j = 0; j < repeat; j++)
    {
        //returns array of **curr_array_sz** elements with index of ne
        int ** array = array_init(curr_array_sz, cache_line_length);
        next_index = 0;

        start_time = gettime();
        //access elems of array with stride i
        for(int k = 0; k < total_steps; k++)
          next_index = array[next_index][0];

        stop_time = gettime();

        abs_time = stop_time - start_time;
        avg_time += abs_time;

        array_destroy(array, curr_array_sz);
    }
    avg_time = avg_time / repeat;
    printf("array_size: %d time: %f \n", curr_array_sz, avg_time);

  }

  return 0;
}
