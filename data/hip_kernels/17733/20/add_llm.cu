#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add( int *a, int *b, int *c ) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a more efficient for loop with stride
    int stride = blockDim.x * gridDim.x;
    for (int i = tid; i < N; i += stride) {
        c[i] = a[i] + b[i];
    }
}