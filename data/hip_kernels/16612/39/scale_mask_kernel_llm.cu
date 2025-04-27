#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid stride loop for better utilization of GPU resources
    for (; i < n; i += blockDim.x * gridDim.x) {
        if (mask[i] == mask_num) x[i] *= scale;
    }
}