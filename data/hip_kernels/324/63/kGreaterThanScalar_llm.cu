#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kGreaterThanScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate the global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the thread is within array bounds
    if (idx < len) {
        target[idx] = mat[idx] > val;
    }
}