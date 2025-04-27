#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultScalar(float* mat, float alpha, float* dest, unsigned int len) {
    // Calculate unique thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure idx within bounds to avoid redundant computation
    if (idx < len) {
        dest[idx] = alpha * mat[idx];
    }
}