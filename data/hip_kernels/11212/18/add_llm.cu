#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add( int *a, int *b, int *c ) {
    // Calculate global thread ID
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    // Ensure tid within bounds
    if (tid < N) {
        c[tid] = a[tid] + b[tid];
    }
}