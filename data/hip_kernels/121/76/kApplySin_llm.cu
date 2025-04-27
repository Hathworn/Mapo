#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel to utilize memory coalescing and reduce loop overhead
__global__ void kApplySin(float* __restrict__ mat, float* __restrict__ target, unsigned int len) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {  // Ensure each thread accesses valid memory
        target[idx] = __sinf(mat[idx]);  // Directly calculate sine for each thread index
    }
}