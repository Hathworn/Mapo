#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add( int *a, int *b, int *c ) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate the stride

    // Use stride to handle larger arrays efficiently
    for (int i = tid; i < N; i += stride) {
        c[i] = a[i] + b[i];  // Perform addition
    }
}