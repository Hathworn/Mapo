#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    // Use blockIdx.z to avoid gridDim.x * gridDim.y calculation for larger grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize loop increment using blockDim.x * gridDim.x
    int stride = blockDim.x * gridDim.x;
    
    while (i < n) {
        if (mask[i] == mask_num) {
            x[i] *= scale; // Only scale if condition meets
        }
        i += stride; // Move to the next element in the grid-stride loop
    }
}