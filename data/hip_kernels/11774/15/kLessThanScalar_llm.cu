#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLessThanScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by removing unnecessary loop and streamline calculations
    if (idx < len) {
        target[idx] = mat[idx] < val;
    }
}