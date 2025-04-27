#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate global linear index
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;
    unsigned int index = ix * ny + iy;

    // Use a single if-statement for combined bounds checking
    if (ix < nx && iy < ny)
    {
        out[index] = in[index];
    }
}