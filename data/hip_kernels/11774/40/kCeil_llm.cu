#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCeil(float* mat, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds for coalesced memory access
    if (idx < len) {
        target[idx] = ceil(mat[idx]);
    }
}