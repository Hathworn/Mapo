#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Ensure that our thread processes within bounds
    if (i < n) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff; // Compute squared error
        delta[i] = diff;  // Store simple difference
    }
}