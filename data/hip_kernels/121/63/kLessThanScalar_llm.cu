#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLessThanScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate the global index using efficient built-in functions
    unsigned int idx = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;

    // Check bounds before performing the operation
    if (idx < len) {
        target[idx] = mat[idx] < val;
    }
}