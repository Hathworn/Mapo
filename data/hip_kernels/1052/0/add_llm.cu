#include "hip/hip_runtime.h"
#include "includes.h"

/*

Jaitirth Jacob - 13CO125      Vidit Bhargava - 13CO151

*/

#define ITERATIONS 4	//Repeat the experiment for greater accuracy

#define N 1000000		//Array Size
#define min_threads 16
#define max_threads 1024

__global__ void add(int *a, int *b, int *c, int tpb)
{
    // Calculate thread index only if within bounds for safety
    int i = blockIdx.x * tpb + threadIdx.x;
    if (i < N) {
        c[i] = a[i] + b[i]; // Perform addition
    }
}