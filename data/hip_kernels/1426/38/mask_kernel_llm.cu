#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation

    // Loop to handle multiple elements per thread in case n is larger than grid size
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) { 
        if (mask[idx] == mask_num) {
            x[idx] = val; // Update value if mask matches
        }
    }
}