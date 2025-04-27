#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLog(float* mat, float* target, unsigned int len, float tiny) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {  // Ensure threads process only valid indices
        target[idx] = __logf(mat[idx] + tiny);
    }
}