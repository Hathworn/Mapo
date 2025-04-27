#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (i < n && mask[i] == mask_num)              // Combined condition on a single line
    {
        x[i] = val;                                // Indented consistently
    }
}