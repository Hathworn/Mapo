#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kCeil(float* mat, float* target, unsigned int len) {
    // Calculate the global index for each thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure each thread handles multiple elements if necessary
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        // Perform ceil operation
        target[i] = ceilf(mat[i]);
    }
}