#include "hip/hip_runtime.h"
#include "includes.h"

#define N 10 // size of vectors
#define B 1 // blocks in the grid
#define T 10 // threads in a block

__global__ void add (int *a, int *b, int *c) {
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform addition only if within bounds
    if (tid < N) {
        c[tid] = a[tid] + b[tid];
    }
}