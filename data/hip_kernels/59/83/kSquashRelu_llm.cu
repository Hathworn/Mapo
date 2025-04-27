#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSquashRelu(float* mat, float* target, unsigned int len, float lambda) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Unroll the loop to optimize performance and reduce loop overhead
    for (unsigned int i = idx; i < len; i += stride) {
        float x = mat[i];
        float exp_val = __expf(-lambda * x);
        target[i] = 2 / (1 + exp_val) - 1; // Use precomputed exp_val
    }
}