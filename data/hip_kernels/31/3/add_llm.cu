#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add( int *a, int *b, int *c ) {
    // Use blockIdx.x * blockDim.x + threadIdx.x for unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use total threads to stride through the array
    int totalThreads = gridDim.x * blockDim.x;
    while (tid < N) {
        c[tid] = a[tid] + b[tid];
        tid += totalThreads;
    }
}