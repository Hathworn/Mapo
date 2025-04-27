#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kMultScalar(float* mat, float alpha, float* dest, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unrolling loop for improved performance
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        dest[i] = alpha * mat[i];
    }
}