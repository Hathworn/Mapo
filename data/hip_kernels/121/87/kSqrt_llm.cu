#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSqrt(float* mat, float* target, unsigned int len) {
    // Optimize access pattern with coalesced memory access by using stride based on grid size
    unsigned int stride = gridDim.x * blockDim.x;
    for (unsigned int i = blockIdx.x * blockDim.x + threadIdx.x; i < len; i += stride) {
        target[i] = sqrt(mat[i]);
    }
}