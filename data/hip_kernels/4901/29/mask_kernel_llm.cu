#include "hip/hip_runtime.h"
#include "includes.h"

// Use blockIdx.z and warp optimization
__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x + blockIdx.z * gridDim.x * gridDim.y) * blockDim.x + threadIdx.x;
    if (i < n && mask[i] == mask_num)
    {
        x[i] = mask_num;
    }
}