#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Use thread ID within block
    if (tid < N)
        c[tid] = a[tid] + b[tid];
}