#include "hip/hip_runtime.h"
#include "includes.h"

// Global kernel function to optimize matrix transposition
__global__ void read_coaleased_write_stride_mat_trans(float* input, float* output, const int nx, const int ny)
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check the bounds condition
    if (ix < nx && iy < ny)
    {
        // Coalesced read and write pattern
        output[iy * nx + ix] = input[ix * ny + iy];
    }
}