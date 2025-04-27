#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kPowMatrix(float* mat, float* pow, float* target, unsigned int len) {
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds and perform power operation if within range
    if (idx < len) {
        target[idx] = powf(mat[idx], pow[idx]);
    }
}