#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access and reduce potential warp divergence
__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    while (i < n) {
        if (mask[i] == mask_num) {
            x[i] *= scale;
        }
        i += stride;  // Ensure all elements are processed
    }
}