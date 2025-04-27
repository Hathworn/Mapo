#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRectifiedLinearDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll the loop to increase instruction-level parallelism
    unsigned int stride = blockDim.x * gridDim.x;
    for (unsigned int i = idx; i < numEls; i += stride) {
        float valB = b[i];  // Cache b[i] in register to reduce memory access
        dest[i] = a[i] * (valB > 0 ? 1 : 0);
    }
}