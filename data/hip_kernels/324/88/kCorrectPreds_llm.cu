#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCorrectPreds(float* mat, float* p, float* target, unsigned int len, float cutoff) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride-based loop for coalesced memory access
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        float pi = p[i];
        float mati = mat[i];
        target[i] = mati * (pi >= cutoff) + (1 - mati) * (pi < cutoff);
    }
}