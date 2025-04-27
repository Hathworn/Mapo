#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelF(const float *d_xAx, const float *d_bx, const float *d_c, float *d_y)
{
    // Calculate thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index bounds
    if (idx < 1) {
        d_y[idx] = d_xAx[idx] + d_bx[idx] + d_c[idx];
    }
}