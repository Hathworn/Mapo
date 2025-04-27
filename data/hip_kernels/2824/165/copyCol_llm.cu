#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copyCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate flattened index in 1D array
    unsigned int index = blockDim.x * blockIdx.x + threadIdx.x +
                         (blockDim.y * blockIdx.y + threadIdx.y) * nx;

    // Check if within bounds of the input matrix
    if (index < nx * ny)
    {
        // Direct copy of the element
        out[index] = in[index];
    }
}