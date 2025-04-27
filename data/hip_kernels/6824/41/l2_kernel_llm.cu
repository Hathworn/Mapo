#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop to ensure all elements are processed
    for (; i < n; i += blockDim.x * gridDim.x) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff;
        delta[i] = diff;
    }
}