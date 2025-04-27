#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute the true global thread index
    int stride = blockDim.x * gridDim.x; // Compute stride for all threads in total grid

    for (int i = idx; i < n; i += stride) // Use strided loop for better memory access pattern
    {
        if (mask[i] == mask_num) 
        {
            x[i] *= scale; // Multiply only if condition is met
        }
    }
}