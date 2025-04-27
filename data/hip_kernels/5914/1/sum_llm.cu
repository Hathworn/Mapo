#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(int *dest, int a, int b) {
    // Use thread and block indices for parallel execution
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if (tid == 0) { // Ensure only one thread performs the addition
        *dest = a + b;
    }
}