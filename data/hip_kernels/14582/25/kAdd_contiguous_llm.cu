#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate the global index for the thread
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x; 
    // Use strided access pattern to process multiple elements per thread
    for (; idx < numEls; idx += blockDim.x * gridDim.x) {
        dest[idx] = a[idx] + b[idx];
    }
}