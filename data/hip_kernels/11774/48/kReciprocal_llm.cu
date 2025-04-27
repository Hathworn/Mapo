#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kReciprocal(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Iterate through elements with stride for better memory access
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = 1.0f / mat[i]; // Use 1.0f for better precision with floats
    }
}