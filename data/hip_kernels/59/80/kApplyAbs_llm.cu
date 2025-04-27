#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kApplyAbs(float* mat, float* target, unsigned int len) {
    // Calculate global index using grid-stride loop for efficiency
    for (unsigned int i = blockIdx.x * blockDim.x + threadIdx.x; i < len; i += blockDim.x * gridDim.x) {
        target[i] = fabsf(mat[i]); // Use built-in function for absolute value
    }
}