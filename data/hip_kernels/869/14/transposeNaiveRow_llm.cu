#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveRow(float *out, float *in, const int nx, const int ny)
{
    // Cache less frequently accessed dimensions to registers
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Check bounds and assign
    if (ix < nx && iy < ny)
    {
        // Reorder memory access for coalescing
        unsigned int inputIndex = iy * nx + ix;
        unsigned int outputIndex = ix * ny + iy;
        out[outputIndex] = in[inputIndex];
    }
}