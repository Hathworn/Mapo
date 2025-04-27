#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if(idx < n) {
        float diff = truth[idx] - pred[idx];
        error[idx] = fabsf(diff); // Use faster fabsf for float absolute value
        delta[idx] = copysignf(1.0f, diff); // Use copysignf to determine the sign
    }
}