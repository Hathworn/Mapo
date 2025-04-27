#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelF(const float *d_xAx, const float *d_bx, const float *d_c, float *d_y)
{
    // Utilize threadIdx.x for potential concurrent execution
    int idx = threadIdx.x;
    // Calculate result in a more concurrent-friendly manner
    d_y[idx] = d_xAx[idx] + d_bx[idx] + d_c[idx];
}