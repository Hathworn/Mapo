#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Using blockDim.x * gridDim.x to compute unique index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Handling boundary cases where i might exceed n
    if (i < n) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff; // Calculate squared error
        delta[i] = diff;        // Store the difference
    }
}