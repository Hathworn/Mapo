#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid-stride loop
    for (; i < n; i += stride) { // Use grid-stride loop to process more data per block
        if (mask[i] == mask_num) x[i] *= scale; // Multiply if condition is met
    }
}