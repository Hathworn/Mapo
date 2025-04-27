#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGamma(float* __restrict__ mat, float* __restrict__ target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that no extra threads do unnecessary work
    if (idx < len) {
        target[idx] = tgammaf(mat[idx]);
    }
}