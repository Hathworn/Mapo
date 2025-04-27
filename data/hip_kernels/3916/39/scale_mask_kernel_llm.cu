#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < n; i += stride) { // Optimize for loop by processing multiple strides
        if (mask[i] == mask_num) {
            x[i] *= scale; // Simplify logic with in-loop scaling
        }
    }
}