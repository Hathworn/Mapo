#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation using 1D grid and blocks
    if(i < n)
    {
        float m = mask[i];  // Cache mask value to reduce global memory access
        if(m == mask_num) 
             x[i] *= scale;
    }
}