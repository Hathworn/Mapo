#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd(float* a, float* b, float* dest, unsigned int numEls) {
    // Compute global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop to increase throughput
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        dest[i] = a[i] + b[i];
    }
}