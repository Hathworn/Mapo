#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add( int *a, int *b, int *c ) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Calculate correct thread id
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid looping
    while (tid < N) {
        c[tid] = a[tid] + b[tid];
        tid += stride;
    }
}