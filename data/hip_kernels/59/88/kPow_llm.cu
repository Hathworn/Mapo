#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kPow(float* mat, float pow, float* target, unsigned int len) {
    // Calculate unique thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        target[idx] = powf(mat[idx], pow); // Perform operation only if within bounds
    }
}