#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kGreaterThanEq(float* mat1, float* mat2, float* target, unsigned int len) {
    // Calculate global index for this thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure idx is within bounds to prevent out-of-range accesses
    if (idx < len) {
        target[idx] = mat1[idx] >= mat2[idx];
    }
    // No need for loop, as each thread now processes one element
}