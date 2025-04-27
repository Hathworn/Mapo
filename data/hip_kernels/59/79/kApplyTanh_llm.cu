#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyTanh(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Unroll loop to improve performance
    for (unsigned int i = idx; i < len; i += numThreads) {
        float mat_i = mat[i];
        float exp2x = __expf(2.0f * mat_i); // Use 2.0f for improved precision
        target[i] = 1.0f - 2.0f / (exp2x + 1.0f); // Ensure consistent type usage with float
    }
}