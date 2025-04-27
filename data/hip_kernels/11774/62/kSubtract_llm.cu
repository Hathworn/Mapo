#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSubtract(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unrolling the loop for better performance
    if (idx < numEls) {
        dest[idx] = a[idx] - b[idx];
    }
}