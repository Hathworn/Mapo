```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel with better memory access pattern
__global__ void kPowMatrix(float* mat, float* pow, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) { // Check bounds to prevent out-of-bounds memory access
        target[idx] = powf(mat[idx], pow[idx]);
    }
}