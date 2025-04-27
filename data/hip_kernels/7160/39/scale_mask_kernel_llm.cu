#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use a loop to process elements in a strided manner
    for (int i = idx; i < n; i += stride) {
        if (mask[i] == mask_num) {
            x[i] *= scale;
        }
    }
}