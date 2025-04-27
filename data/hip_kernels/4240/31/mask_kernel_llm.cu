#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by using blockDim.y and threadIdx.y to improve warp efficiency
__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    int i = ((blockIdx.y * gridDim.x + blockIdx.x) * blockDim.y + threadIdx.y) * blockDim.x + threadIdx.x;
    if (i < n && mask[i] == mask_num) x[i] = mask_num;
}