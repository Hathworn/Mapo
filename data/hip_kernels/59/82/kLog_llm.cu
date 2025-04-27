#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLog(float* mat, float* target, unsigned int len, float tiny) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Simplified stride loop by handling boundary condition directly in a single pass
    if (idx < len) {
        target[idx] = __logf(mat[idx] + tiny);
    }
}