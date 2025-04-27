#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(int *a, int *b, int *c) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Prefetch memory globally to reduce global memory access
    for (; i < N; i += blockDim.x * gridDim.x) {
        c[i] = __ldg(&a[i]) * __ldg(&b[i]);
    }
}