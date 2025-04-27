#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    int stride = gridDim.x * blockDim.x; // Calculate stride for grids

    // Loop through the array using stride to maximize parallelism
    for (; i < n; i += stride) {
        if (mask[i] == mask_num) x[i] = val;
    }
}