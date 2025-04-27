#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    // Calculate unique thread index for 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a global stride loop to cover all data
    for (; i < n; i += blockDim.x * gridDim.x)
    {
        // Check mask and apply scaling
        if (mask[i] == mask_num)
        {
            x[i] *= scale;
        }
    }
}