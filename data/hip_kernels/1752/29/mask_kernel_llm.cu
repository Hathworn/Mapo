#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds and if mask matches
    if (i < n) {
        float maskVal = mask[i];  // Read mask value once
        if (maskVal == mask_num)  // Compare with mask_num
            x[i] = mask_num;
    }
}