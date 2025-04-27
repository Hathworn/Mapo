#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    if (i < n && mask[i] == mask_num)  // Conditional to check within bounds and mask number
    {
        x[i] = val;  // Assign value if condition meets
    }
}