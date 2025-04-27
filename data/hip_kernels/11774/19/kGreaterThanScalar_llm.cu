#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGreaterThanScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate global index for each thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threads operate within bounds of the array
    if (idx < len) {
        target[idx] = mat[idx] > val;
    }
}