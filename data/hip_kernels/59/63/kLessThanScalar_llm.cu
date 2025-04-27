#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLessThanScalar(float* mat, float val, float* target, unsigned int len) {
    // Use a single index calculation to improve code clarity and reduce potential errors
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index bounds before updating target to avoid unnecessary operations
    if (idx < len) target[idx] = mat[idx] < val;
}