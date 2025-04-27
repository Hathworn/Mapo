#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDivide(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll the loop to process multiple elements per thread, improving performance
    while (idx < numEls) {
        dest[idx] = a[idx] / b[idx];
        idx += blockDim.x * gridDim.x;
    }
}