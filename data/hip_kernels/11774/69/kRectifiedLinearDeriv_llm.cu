#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRectifiedLinearDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate the global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll the loop to handle multiple elements per thread for better performance
    const unsigned int stride = blockDim.x * gridDim.x;
    unsigned int i = idx;
    
    while (i < numEls) {
        dest[i] = a[i] * (b[i] > 0 ? 1 : 0);
        i += stride; // Move to the next element handled by this thread
    }
}