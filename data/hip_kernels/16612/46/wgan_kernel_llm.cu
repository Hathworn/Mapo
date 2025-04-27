#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global index efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Check if index is within range
    if (i < n) {
        // Use ternary operators for concise conditional assignments
        error[i] = truth[i] ? -pred[i] : pred[i];
        delta[i] = truth[i] > 0 ? 1 : -1;
    }
}