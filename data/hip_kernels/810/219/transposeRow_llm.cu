#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate row and column indices for 2D block and grid
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check that indices are within matrix bounds
    if (ix < nx && iy < ny) {
        unsigned int in_index = iy * nx + ix;  // 1D input index
        unsigned int out_index = ix * ny + iy; // Transposed 1D output index
        out[out_index] = in[in_index];         // Transpose by writing into correct position
    }
}