#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kDivideScalar(float* mat, float alpha, float* dest, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds before computation to avoid unnecessary loops
    if (idx < len) {
        // Perform the division directly
        dest[idx] = mat[idx] / alpha;
    }
}