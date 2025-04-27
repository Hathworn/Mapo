#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kPow(float* mat, float pow, float* target, unsigned int len) {
    // Calculate global thread ID
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop to enhance performance
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = powf(mat[i], pow);
    }
}