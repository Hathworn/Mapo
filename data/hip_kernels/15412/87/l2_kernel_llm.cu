#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use block-level stride to ensure all elements are processed
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculation outside of loop for efficiency

    for (int idx = i; idx < n; idx += stride) {
        float diff = truth[idx] - pred[idx];
        error[idx] = diff * diff; // Compute squared difference
        delta[idx] = diff;        // Compute difference (delta)
    }
}