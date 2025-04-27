#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTanhDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Loop with stride for coalesced global memory access and better occupancy
    for (unsigned int i = idx; i < numEls; i += stride) {
        float bi = b[i]; // Cache b[i] to reduce memory reads
        dest[i] = a[i] * (1.0f + bi) * (1.0f - bi) * 0.5f; // Use float literals
    }
}