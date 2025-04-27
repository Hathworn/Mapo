#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Using blockIdx.x and distributing grid properly for better performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff;
        delta[i] = diff;
    }
}