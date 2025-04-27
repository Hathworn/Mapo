#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyTanh(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use register for frequently accessed variables.
    float mat_i, exp2x;

    for (unsigned int i = idx; i < len; i += numThreads) {
        mat_i = mat[i];
        exp2x = __expf(2.0f * mat_i);  // Ensure floating point precision.
        target[i] = 1.0f - 2.0f / (exp2x + 1.0f);  // Use 1.0f for consistency in floats.
    }
}