#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scl_f32 (float* __restrict__ vector, float value, float* __restrict__ output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        // Use of __restrict__ to optimize memory access
        output[idx] = __fmaf_rn(vector[idx], value, 0.0f); // Use fused multiply-add for potential performance gain
    }
}