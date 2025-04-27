#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vxy_kernel(const float* __restrict__ x, const float* __restrict__ y, float* __restrict__ result, unsigned int len) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure memory access is coalesced and avoid redundant calculations
    if (idx < len) {
        result[idx] = x[idx] * y[idx];
    }
}