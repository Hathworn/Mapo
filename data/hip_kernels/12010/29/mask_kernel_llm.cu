#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Calculate the global index using a more efficient method
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    if (i < n && mask[i] == mask_num)
    {
        // Write the masked number to the output if conditions are met
        x[i] = mask_num;
    }
}