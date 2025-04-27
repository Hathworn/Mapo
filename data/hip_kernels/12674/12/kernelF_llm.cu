#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelF(const float *d_xAx, const float *d_bx, const float *d_c, float *d_y)
{
    // Using threadIdx.x to allow parallel computation
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    d_y[idx] = d_xAx[idx] + d_bx[idx] + d_c[idx];
}