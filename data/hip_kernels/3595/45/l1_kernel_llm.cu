```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Optimize by calculating global index once
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure no out-of-bounds access
    if (idx < n) {
        // Load once to reduce memory access
        float predVal = pred[idx];
        float truthVal = truth[idx];
        float diff = truthVal - predVal;
        
        // Use absolute function and integer comparison for performance
        error[idx] = fabsf(diff);
        delta[idx] = (diff > 0) ? 1.0f : -1.0f;
    }
}