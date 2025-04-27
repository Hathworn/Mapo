#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Avoid extra calculations in the kernel by pre-calculating the index
    unsigned int index = iy * nx + ix;

    if (ix < nx && iy < ny)
    {
        out[index] = in[index];
    }
}