#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified and more efficient index calculation
    int grid_size = gridDim.x * blockDim.x; // Total number of threads in the grid
    
    // Loop for processing more elements if grid is smaller than n
    for(; i < n; i += grid_size)
    {
        if(mask[i] == mask_num)
        {
            x[i] = mask_num;
        }
    }
}