#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kExp(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) { // Check bounds to avoid unnecessary calculations
        target[idx] = __expf(mat[idx]); // Use idx directly since it's within bounds
    }
}