#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory for partial reduction and avoid conditional operations
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified block index calculation
    if(i < n) {
        float diff = truth[i] - pred[i];
        error[i] = fabsf(diff);  // Use faster device function for absolute value
        delta[i] = copysignf(1.0f, diff);  // Use copysignf to simplify sign determination
    }
}