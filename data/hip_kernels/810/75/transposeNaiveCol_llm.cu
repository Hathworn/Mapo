#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveCol(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Efficient memory access by converting 2D index to 1D
    if (ix < nx && iy < ny)
    {
        unsigned int in_index = ix * ny + iy;
        unsigned int out_index = iy * nx + ix;
        out[out_index] = in[in_index];
    }
}