#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void warmup(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int index = iy * nx + ix;

    if (ix < nx && iy < ny)
    {
        out[index] = in[index];
    }
}