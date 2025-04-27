#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelF(const float *d_xAx, const float *d_bx, const float *d_c, float *d_y)
{
    // Use block and thread indices for parallel computation
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check array bounds; assume d_y is pre-allocated with the correct size
    if (idx < 1)  // Assuming we only need 1 element; otherwise adjust according to array size
    {
        d_y[idx] = d_xAx[idx] + d_bx[idx] + d_c[idx];
    }
}