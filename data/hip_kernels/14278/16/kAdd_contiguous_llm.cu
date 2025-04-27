```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate thread's global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process multiple elements in each thread to increase throughput
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        dest[i] = a[i] + b[i];
    }
}