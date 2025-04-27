#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel for better performance
__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (i < n && mask[i] == mask_num)
    {
        x[i] = val;
    }
}