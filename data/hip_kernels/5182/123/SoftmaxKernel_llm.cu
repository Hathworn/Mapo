#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SoftmaxKernel(float *outputPtr, float expSum, int layerSize)
{
    // Calculate the global thread ID using 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Only process within bounds
    if (i < layerSize)
    {
        // Optimize division by using multiplication with reciprocal of expSum
        outputPtr[i] *= __frcp_rn(expSum);
    }
}