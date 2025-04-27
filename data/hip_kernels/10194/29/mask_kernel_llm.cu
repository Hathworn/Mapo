#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread operates within bounds and applies the mask
    if (i < n && mask[i] == mask_num) 
    {
        // Apply the mask
        x[i] = mask_num;
    }
}