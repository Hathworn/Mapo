#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeRow(float *out, float *in, const int nx, const int ny) 
{
    // Optimized: Flattened 2D grid and block indices into a linear index.
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix < nx && iy < ny) {
        // Optimized: Calculate the linear index directly.
        unsigned int input_index = iy * nx + ix;
        unsigned int output_index = ix * ny + iy;
        out[output_index] = in[input_index];
    }
}