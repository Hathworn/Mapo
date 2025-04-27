#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGreaterThanEqScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate a unique index for each thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check that the index is within bounds
    if (idx < len) {
        // Perform comparison and write result
        target[idx] = mat[idx] >= val;
    }
}