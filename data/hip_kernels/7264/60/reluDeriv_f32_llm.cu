#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reluDeriv_f32(float* vector, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use warp-level intrinsic to avoid branch divergence
    if (idx < len) {
        float val = vector[idx];
        output[idx] = __frcp_rn(__fadd_rn(1.0f, __frcp_rn(__fmul_rn(val, __fadd_rn(val, -1.0f)))));
    }
}