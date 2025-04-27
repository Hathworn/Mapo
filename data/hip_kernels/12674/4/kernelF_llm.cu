#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelF(const float *d_xAx, const float *d_bx, const float *d_c, float *d_y)
{
    // Use threadIdx to parallelize summation if necessary
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx == 0) // Ensure single write to d_y since input is scalar
    {
        *d_y = *d_xAx + *d_bx + *d_c;
    }
}