#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate 1D block and grid indices using threadIdx and blockIdx for coalesced memory access
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = gridDim.x * blockDim.x;

    // Loop with a stride to cover the entire array
    while (idx < nx * ny)
    {
        out[idx] = in[idx];
        idx += stride;
    }
}