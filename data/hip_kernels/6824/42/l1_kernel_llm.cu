#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Optimize thread index calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process in steps of total threads
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        float diff = truth[idx] - pred[idx];
        error[idx] = fabsf(diff); // Use faster intrinsic function
        delta[idx] = (diff > 0.0f) ? 1.0f : -1.0f; // Ensure type consistency
    }
}