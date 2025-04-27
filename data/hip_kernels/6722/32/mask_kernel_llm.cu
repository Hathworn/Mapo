#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of index within 1D grid
    if (i < n && mask[i] == mask_num) // Check if within bounds
    {
        x[i] = mask_num; // Assign value based on mask
    }
}