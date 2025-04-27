#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    // Efficiently calculate row-major index in 2D grid
    unsigned int rowIdx = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int colIdx = blockIdx.x * blockDim.x + threadIdx.x;

    if (rowIdx < ny && colIdx < nx)
    {
        unsigned int index = rowIdx * nx + colIdx; // Compute 1D index for 2D data
        out[index] = in[index];
    }
}