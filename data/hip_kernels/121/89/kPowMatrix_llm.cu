#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kPowMatrix(float* mat, float* pow, float* target, unsigned int len) {
    // Thread index calculation
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Step through array using stride pattern
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = powf(mat[i], pow[i]);
    }
}