#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAdd(int *a, int *b, int *c, int n) {
    // Using improved block and thread indexing
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Using loop unrolling for performance
    #pragma unroll
    for (; i < n; i += blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i];
    }
}