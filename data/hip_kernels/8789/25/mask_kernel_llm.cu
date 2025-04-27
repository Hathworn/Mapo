```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Use 1D grid
    if (i < n && mask[i] == mask_num) // Check bounds and condition
    {
        x[i] = mask_num; // Set x[i] to mask_num
    }
}