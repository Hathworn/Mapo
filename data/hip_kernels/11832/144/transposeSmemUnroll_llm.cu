#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeSmemUnroll(float *out, float *in, const int nx, const int ny)
{
    // Reuse shared memory for 2D tile
    __shared__ float tile[BDIMY * BDIMX * 2];

    // Original matrix coordinates
    unsigned int ix = 2 * blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Linear index in original matrix
    unsigned int ti = iy * nx + ix;

    // Transposed block thread index
    unsigned int bidx = threadIdx.y * blockDim.x + threadIdx.x;
    unsigned int irow = bidx / blockDim.y;
    unsigned int icol = bidx % blockDim.y;

    // Transposed matrix coordinates
    unsigned int ix2 = blockIdx.y * blockDim.y + icol;
    unsigned int iy2 = 2 * blockIdx.x * blockDim.x + irow;

    // Linear index in transposed matrix
    unsigned int to = iy2 * ny + ix2;

    // Boundary check for loading
    if (ix + blockDim.x < nx && iy < ny)
    {
        // Coalesced global to shared memory load
        unsigned int row_idx = 2 * threadIdx.y * blockDim.x + threadIdx.x;
        tile[row_idx]       = in[ti];
        tile[row_idx + BDIMX] = in[ti + BDIMX];

        // Synchronization for shared memory
        __syncthreads();

        // Shared to global memory store
        unsigned int col_idx = icol * blockDim.x * 2 + irow;
        if (ix2 < ny && iy2 < nx)  // Boundary check for storing
        {
            out[to] = tile[col_idx];
            out[to + ny * BDIMX] = tile[col_idx + BDIMX];
        }
    }
}