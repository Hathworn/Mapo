#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add( int *a, int *b, int *c ) {
    // Optimize by using threadIdx.x for parallelism 
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;
    while (tid < N) {
        c[tid] = a[tid] + b[tid];
        tid += totalThreads;
    }
}