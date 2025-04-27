#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize grid calculation assuming 1D block and grid
    int stride = gridDim.x * blockDim.x; // Compute stride for further iteration

    for (; i < n; i += stride) { // Loop through elements with stride
        if (mask[i] == mask_num) { // Only branch if necessary
            x[i] *= scale;
        }
    }
}