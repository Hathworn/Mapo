#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Use a single loop iteration per thread for better readability and performance
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) {
        dest[idx] = a[idx] + b[idx];
    }
}