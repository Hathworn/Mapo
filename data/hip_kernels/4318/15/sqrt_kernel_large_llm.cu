#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for computing square root
__global__ void sqrt_kernel_large(float* x, unsigned int len, unsigned int rowsz) {
    // Cache thread and block indices
    unsigned int tid = threadIdx.x;
    unsigned int bid = blockIdx.x;
    unsigned int bj = blockIdx.y;

    // Compute global index with improved readability
    unsigned int idx = tid + bid * blockDim.x + bj * rowsz;
    
    // Check bounds once
    if (idx < len) {
        // Compute square root
        x[idx] = sqrt(x[idx]);
    }
}