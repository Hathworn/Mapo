#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLowerBound(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate flattened grid index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize loop by checking bounds inside loop
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = fmaxf(mat1[i], mat2[i]); // Use fmaxf for clarity and potential performance benefits
    }
}