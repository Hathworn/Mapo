#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation for 1D grid
    int stride = gridDim.x * blockDim.x;            // Calculate the stride for loop unrolling

    for (int idx = i; idx < n; idx += stride) {     // Loop to cover all elements in steps of stride
        if (mask[idx] == mask_num) x[idx] = val;    // Only update if the mask condition is met
    }
}