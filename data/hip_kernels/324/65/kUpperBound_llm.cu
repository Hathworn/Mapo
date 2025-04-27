#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpperBound(float* mat1, float* mat2, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll loop to improve memory_coalescing and performance
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        float val1 = mat1[i];
        float val2 = mat2[i];
        target[i] = val1 > val2 ? val2 : val1;
    }
}