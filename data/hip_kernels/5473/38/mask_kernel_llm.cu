#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify block index calculation
    int stride = gridDim.x * blockDim.x;          // Define stride for processing large arrays

    for(; i < n; i += stride) {                    // Process elements with stride to maximize GPU utilization
        if(mask[i] == mask_num) {                  // Use more readable code block structure
            x[i] = val;
        }
    }
}