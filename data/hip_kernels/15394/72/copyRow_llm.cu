#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Combine the index calculation to reduce repeated computation
    unsigned int index = iy * nx + ix;

    if (ix < nx && iy < ny)
    {
        out[index] = in[index];
    }
}