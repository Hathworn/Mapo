#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(int *dest, int a, int b) {
    // Use blockIdx and threadIdx to ensure it's optimized for multiple threads
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) { // Ensure only first thread performs addition
        *dest = a + b;
    }
}