#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Calculate unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Process only valid indices
    if(i < n && __ldg(&mask[i]) == mask_num) 
    {
        x[i] = mask_num;
    }
}