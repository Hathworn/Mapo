#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    // Calculate the thread's global index using blockIdx, blockDim, and threadIdx
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    // Check to ensure index is within bounds
    if (i < n) {
        // Compute the weighted sum with branchless logic for b
        float b_val = (b != nullptr) ? b[i] : 0.0f;
        c[i] = s[i] * a[i] + (1.0f - s[i]) * b_val;
    }
}