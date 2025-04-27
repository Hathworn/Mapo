#include "hip/hip_runtime.h"
#include "includes.h"
/*
#define N 512

#define N 2048
#define THREADS_PER_BLOCK 512

*/
const int THREADS_PER_BLOCK = 32;
const int N = 2048;

__global__ void shared_mult(int *a, int *b, int *c)
{
    __shared__ int mem[THREADS_PER_BLOCK];
    int pos = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if pos is within bounds
    if (pos < N) {
        mem[threadIdx.x] = a[pos] * b[pos];
    }

    __syncthreads();

    // Check if pos is within bounds before writing to output
    if (pos < N) {
        c[pos] = mem[threadIdx.x];
    }
}