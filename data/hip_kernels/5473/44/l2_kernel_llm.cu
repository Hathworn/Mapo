#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    if (i < n) {
        float diff = truth[i] - pred[i];
        float diff_squared = diff * diff;
        error[i] = diff_squared; // Calculating squared difference
        delta[i] = diff; // Assign the difference to delta
    }
}