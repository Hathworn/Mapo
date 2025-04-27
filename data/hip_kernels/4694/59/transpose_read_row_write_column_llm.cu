#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_read_row_write_column(int * mat, int * transpose, int nx, int ny)
{
    // Calculate global id
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds
    if (ix < nx && iy < ny)
    {
        // Coalesced memory access
        int index_in = iy * nx + ix;
        int index_out = ix * ny + iy;
        transpose[index_out] = mat[index_in];
    }
}