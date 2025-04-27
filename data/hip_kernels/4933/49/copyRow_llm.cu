#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockIdx.y;  // Removed unnecessary blockDim.y calculation since only rows are copied

    if (ix < nx && iy < ny)
    {
        unsigned int idx = iy * nx + ix;  // Calculate the index once
        out[idx] = in[idx];
    }
}