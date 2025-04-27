#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    // Use block indexing and thread indexing for optimal memory access
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterate over elements using stride for coalesced memory access
    for (int i = idx; i < n; i += blockDim.x * gridDim.x)
    {
        if (mask[i] == mask_num) // Condition to check mask
        {
            x[i] *= scale; // Scale if condition is met
        }
    }
}