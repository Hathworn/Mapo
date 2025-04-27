#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + 
            blockIdx.y * gridDim.x * blockDim.x;

    // Ensure within bounds and apply mask conditionally
    if (i < n) {
        float mask_val = mask[i]; // Avoid redundant global memory access
        if (mask_val == mask_num) {
            x[i] = mask_num;
        }
    }
}