#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of 'i'

    if (i < n && mask[i] == mask_num) // Kept conditional check
    {
        x[i] = mask_num;
    }
}