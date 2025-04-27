#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddMultSign(float* a, float* b, unsigned int numEls, float mult) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x; // Calculate stride once

    for (unsigned int i = idx; i < numEls; i += stride) {
        float b_value = b[i]; // Cache b[i] value
        float addition = (b_value > 0) ? mult : ((b_value < 0) ? -mult : 0); // Determine addition
        a[i] += addition; // Directly update a[i]
    }
}