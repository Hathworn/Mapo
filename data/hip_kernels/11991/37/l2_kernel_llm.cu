#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (i < n) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff; // Compute error as square of the difference
        delta[i] = diff; // Store difference in delta
    }
}