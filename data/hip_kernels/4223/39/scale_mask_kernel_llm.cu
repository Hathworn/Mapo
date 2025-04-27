#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int totalThreads = gridDim.x * blockDim.x; // Calculate total number of threads

    for(int idx = i; idx < n; idx += totalThreads) // Loop through elements with grid stride
    {
        if(mask[idx] == mask_num) // Check mask
        {
            x[idx] *= scale; // Apply scaling
        }
    }
}