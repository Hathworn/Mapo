#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate global thread index using block and grid dimensions
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * (gridDim.x * blockDim.x); 

    // Ensure thread index is within array bounds and perform masking
    if (i < n) 
    {
        // Use mask for conditional assignment
        if (mask[i] == mask_num) 
        {
            x[i] = val;
        }
    }
}