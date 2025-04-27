#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExp(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use stride loop for better memory coalescing 
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = __expf(mat[i]);
    }
}