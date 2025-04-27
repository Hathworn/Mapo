#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideScalar(float* mat, float alpha, float* dest, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds to avoid unnecessary calculations
    if (idx < len) {
        // Perform division only for valid indices
        dest[idx] = mat[idx] / alpha;
    }
}