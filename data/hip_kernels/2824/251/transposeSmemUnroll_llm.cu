#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeSmemUnroll(float *out, float *in, const int nx, const int ny)
{
    // Static 1D shared memory with sufficient space
    __shared__ float tile[BDIMY * BDIMX * 2];

    // Coordinate in original matrix
    unsigned int ix = 2 * blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Linear global memory index for original matrix
    unsigned int ti = iy * nx + ix;

    // 2D thread index in 2D transposed block
    unsigned int bidx = threadIdx.y * blockDim.x + threadIdx.x;
    unsigned int irow = bidx / blockDim.y;
    unsigned int icol = bidx % blockDim.y;

    // Coordinate in transposed matrix
    unsigned int ix2 = blockIdx.y * blockDim.y + icol;
    unsigned int iy2 = 2 * blockIdx.x * blockDim.x + irow;

    // Linear global memory index for transposed matrix
    unsigned int to = iy2 * ny + ix2;

    if (ix + blockDim.x < nx && iy < ny)
    {
        // Load two rows from global memory to shared memory
        unsigned int row_idx = 2 * threadIdx.y * blockDim.x + threadIdx.x;
        tile[row_idx] = in[ti];
        tile[row_idx + BDIMX] = in[ti + BDIMX];

        // Thread synchronization: ensuring all data is loaded
        __syncthreads();

        // Store two rows to global memory from two columns of shared memory
        unsigned int col_idx = irow * (blockDim.x * 2) + icol; // Fixing index for accessibility
        out[to] = tile[col_idx];
        out[to + ny * BDIMX] = tile[col_idx + BDIMX];
    }
}
```
