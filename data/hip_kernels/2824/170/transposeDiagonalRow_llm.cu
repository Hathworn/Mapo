#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate the coordinates using grid-stride loop to handle larger arrays
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Loop to ensure all elements are processed even if data size exceeds grid size
    for (unsigned int i = ix; i < nx; i += blockDim.x * gridDim.x)
    {
        for (unsigned int j = iy; j < ny; j += blockDim.y * gridDim.y)
        {
            // Ensure bounds are respected and perform the transpose
            if (i < nx && j < ny)
            {
                out[i * ny + j] = in[j * nx + i];
            }
        }
    }
}