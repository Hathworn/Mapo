#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_identity_kernel(float *a, int m, int n) {
    int idx = blockIdx.y * blockDim.y + threadIdx.y;
    int idy = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by ensuring computation only for relevant thread indices
    if (idx < m && idy < n) {
        int index = idx * n + idy; // Compute element index once
        a[index] = (idx == idy) ? 1.0f : 0.0f; // Simplify conditional logic
    }
}