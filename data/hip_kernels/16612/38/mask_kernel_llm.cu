#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate unique thread index in grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread does not access out-of-bounds memory and apply mask
    if (i < n && mask[i] == mask_num)
    {
        x[i] = val;
    }
}