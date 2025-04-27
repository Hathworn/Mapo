#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid
    if (i < n) {
        float diff = truth[i] - pred[i];
        error[i] = fabsf(diff); // Use device-specific abs function
        delta[i] = copysignf(1.0f, diff); // Use copysignf to set delta
    }
}