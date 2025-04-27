#include "hip/hip_runtime.h"
#include "includes.h"

const int blockSize = 1024;

// Optimized global kernel function with a check for index bounds
__global__ void assign(uint32_t *x, uint32_t n) {
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use only the first thread to perform the assignment
    if (idx == 0) {
        x[0] = n;
    }
}