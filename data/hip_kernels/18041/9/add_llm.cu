#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int addem(int a, int b) {
    return a + b;
}

__global__ void add(int a, int b, int *c) {
    // Use blockIdx and threadIdx to ensure parallel execution
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) { // Ensure only one thread writes to *c
        *c = addem(a, b);
    }
}