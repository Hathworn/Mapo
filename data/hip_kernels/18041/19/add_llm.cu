#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add( int *a, int *b, int *c ) {
    // Calculate global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x; 
    int stride = blockDim.x * gridDim.x;
    
    // Use loop unrolling to optimize performance
    while (tid + 4 < N) {
        c[tid] = a[tid] + b[tid];
        c[tid + 1] = a[tid + 1] + b[tid + 1];
        c[tid + 2] = a[tid + 2] + b[tid + 2];
        c[tid + 3] = a[tid + 3] + b[tid + 3];
        tid += 4 * stride;
    }
    
    // Process remaining elements if N is not divisible by 4*stride
    while (tid < N) {
        c[tid] = a[tid] + b[tid];
        tid += stride;
    }
}