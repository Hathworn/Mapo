#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate global row and column indices.
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure indices are within the bounds of the input matrix.
    if (ix < nx && iy < ny)
    {
        int input_index = iy * nx + ix; // Calculate 1D index for the input array.
        int output_index = ix * ny + iy; // Calculate 1D index for the transposed output array.
        out[output_index] = in[input_index]; // Perform the transpose by swapping indices.
    }
}