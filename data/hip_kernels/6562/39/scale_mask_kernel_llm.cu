#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;

    // Loop through data in a grid-stride loop for better workload distribution
    for (; i < n; i += gridStride) {
        if (mask[i] == mask_num) {
            x[i] *= scale;
        }
    }
}