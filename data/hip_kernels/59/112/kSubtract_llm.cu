#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSubtract(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate the global index for each thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure threads work only within valid index range
    if (idx < numEls) {
        dest[idx] = a[idx] - b[idx];
    }
}