#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGreaterThanScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by removing unnecessary variable and loop
    if (idx < len) {
        target[idx] = mat[idx] > val;
    }
}