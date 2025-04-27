#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation for 1D block distribution
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid-stride loop

    for (; i < n; i += stride) // Use grid-stride loop for better occupancy
    {
        if (mask[i] == mask_num) // Efficient conditional check
        {
            x[i] = mask_num; // Perform operation if condition is met
        }
    }
}