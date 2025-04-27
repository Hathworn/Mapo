#include "hip/hip_runtime.h"
#include "includes.h"

// Improved l1 kernel function
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if(i < n)
    {
        float diff = truth[i] - pred[i];
        
        // Use built-in functions for performance optimization
        error[i] = fabsf(diff);
        delta[i] = copysignf(1.0f, diff);
    }
}