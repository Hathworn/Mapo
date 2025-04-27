#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kApplyAbs(float* mat, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize linear-thread cache for reduced memory access latency
    if (idx < len) {
        target[idx] = fabsf(mat[idx]);
    }
}