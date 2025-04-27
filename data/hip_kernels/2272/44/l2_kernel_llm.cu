#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation

    // Check bounds and perform computation
    if (idx < n) {
        float diff = truth[idx] - pred[idx];
        error[idx] = diff * diff; // Error calculation
        delta[idx] = diff; // Delta calculation
    }
}