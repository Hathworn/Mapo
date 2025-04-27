#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Improved index calculation for warp divergence reduction
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < numEls) {
        dest[idx] = a[idx] + b[idx];
    }
    
    // Additional loop to cover any remaining elements if numEls isn't a multiple of numThreads
    idx += blockDim.x * gridDim.x;
    while (idx < numEls) {
        dest[idx] = a[idx] + b[idx];
        idx += blockDim.x * gridDim.x;
    }
}