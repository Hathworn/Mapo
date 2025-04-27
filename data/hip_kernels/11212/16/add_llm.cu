#include "hip/hip_runtime.h"
#include "includes.h"

#define N 1024  // Assuming a macro definition for N

__global__ void add(int *a, int *b, int *c) {
    // Get the thread id with consideration of block and thread dimensions
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform addition only if within bounds
    if (tid < N)
        c[tid] = a[tid] + b[tid];
}