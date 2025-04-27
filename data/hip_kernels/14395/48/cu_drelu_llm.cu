#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_drelu(const float* src, float* dst, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid < n) {  // Ensure thread within bounds
        float s = src[tid];
        dst[tid] = (s > 0.0f) ? 1.0f : 0.0f;  // Use ternary operator for conditional assignment
    }
}