#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize boundary condition and mask check
    if (i < n && __ldg(&mask[i]) == mask_num) {
        // Scale the element if mask matches mask_num
        x[i] *= scale;
    }
}