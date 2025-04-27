#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate thread ID more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we are working within the bounds of the data
    if (i < n) {
        float diff = truth[i] - pred[i];
        
        // Reduce the number of memory writes by combining operations
        float diff_squared = diff * diff;
        error[i] = diff_squared;
        delta[i] = diff;
    }
}