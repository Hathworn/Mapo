#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMaximum(float* __restrict__ mat1, float* __restrict__ mat2, float* __restrict__ target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we do not exceed the bounds
    if (idx < len) {
        target[idx] = fmaxf(mat1[idx], mat2[idx]);
    }
}