#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for processing larger arrays

    // Loop to handle cases where total number of threads is less than n
    for (; i < n; i += stride)
    {
        if (mask[i] == mask_num)
        {
            x[i] = val;
        }
    }
}