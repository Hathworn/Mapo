#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeSmemUnrollPad(float *out, float *in, const int nx, const int ny)
{
    // Static 1D shared memory with padding
    __shared__ float tile[BDIMY * (BDIMX * 2 + IPAD)];

    // Coordinate in original matrix
    unsigned int ix = 2 * blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Linear global memory index for original matrix
    unsigned int ti = iy * nx + ix;

    // Thread index in transposed block
    unsigned int bidx = threadIdx.y * blockDim.x + threadIdx.x;
    unsigned int irow = bidx / blockDim.y;
    unsigned int icol = bidx % blockDim.y;

    // Coordinate in transposed matrix
    unsigned int ix2 = blockIdx.y * blockDim.y + icol;
    unsigned int iy2 = 2 * blockIdx.x * blockDim.x + irow;

    // Linear global memory index for transposed matrix
    unsigned int to = iy2 * ny + ix2;

    if (ix < nx && ix + blockDim.x < nx && iy < ny)
    {
        // Load two rows from global memory to shared memory
        unsigned int row_idx = threadIdx.y * (blockDim.x * 2 + IPAD) + threadIdx.x;
        tile[row_idx] = in[ti];
        tile[row_idx + BDIMX] = in[ti + BDIMX];

        // Thread synchronization
        __syncthreads();

        // Store two rows to global memory from two columns of shared memory
        unsigned int col_idx = icol * (blockDim.x * 2 + IPAD) + irow;
        out[to]             = tile[col_idx];
        out[to + ny * BDIMX] = tile[col_idx + BDIMX];
    }
}