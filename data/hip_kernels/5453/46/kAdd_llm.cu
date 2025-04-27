#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd(float* __restrict__ a, float* __restrict__ b, float* __restrict__ dest, unsigned int numEls) {
    // Calculate the unique thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a block-wide stride to allow unrolled loop for better memory access pattern
    if(idx < numEls) {
        dest[idx] = a[idx] + b[idx];
    }
}