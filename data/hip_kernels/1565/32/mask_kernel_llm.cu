#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Calculate the global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Check bounds and mask condition
    if (i < n && mask[i] == mask_num) 
    {
        // Update the value if condition is true
        x[i] = mask_num;
    }
}