#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSubtract(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate the unique index for the thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop to allow multiple passes of all elements if needed
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        // Perform subtraction
        dest[i] = a[i] - b[i];
    }
}