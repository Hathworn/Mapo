#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global index for current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index does not exceed bounds
    if(i < n) {
        float diff = truth[i] - pred[i];
        // Use fma for efficient computation of error[i] = diff * diff (if supported)
        error[i] = diff * diff; 
        delta[i] = diff;
    }
}