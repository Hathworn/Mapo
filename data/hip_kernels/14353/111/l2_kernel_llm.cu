#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate only once to avoid redundant calculations
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Ensure thread handles valid index within bounds
    if(index < n)
    {
        float diff = truth[index] - pred[index];
        
        // Compute error and delta in a streamlined manner
        error[index] = diff * diff;
        delta[index] = diff;
    }
}