#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;

    // Process all elements assigned to a thread using grid-stride loop
    for (; i < n; i += gridStride) {
        if (mask[i] == mask_num) {
            x[i] *= scale;
        }
    }
}