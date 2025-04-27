#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop to improve memory access pattern
    for (int index = i; index < n; index += blockDim.x * gridDim.x)
    {
        // Use short-circuit evaluation for better performance
        if (mask[index] == mask_num)
        {
            x[index] = val;
        }
    }
}