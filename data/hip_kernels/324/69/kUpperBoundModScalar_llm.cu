#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpperBoundModScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll the loop for better performance
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < len; i += stride) {
        float element = mat[i];
        // Use ternary conditions to directly assign the value to target
        target[i] = element > val ? val : (element < -val ? -val : element);
    }
}