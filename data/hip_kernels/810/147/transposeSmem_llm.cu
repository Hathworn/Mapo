#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeSmem(float *out, float *in, int nx, int ny)
{
    // Static shared memory with padding to avoid bank conflicts
    __shared__ float tile[BDIMY][BDIMX + 1];

    // Coordinate in original matrix
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Linear global memory index for original matrix
    unsigned int ti = iy * nx + ix;

    // Thread index in transposed block
    unsigned int bidx = threadIdx.y * blockDim.x + threadIdx.x;
    unsigned int irow = bidx / blockDim.y;
    unsigned int icol = bidx % blockDim.y;

    // Coordinate in transposed matrix
    unsigned int trans_ix = blockDim.y * blockIdx.y + icol;
    unsigned int trans_iy = blockDim.x * blockIdx.x + irow;

    // Linear global memory index for transposed matrix
    unsigned int to = trans_iy * ny + trans_ix;

    // Transpose with boundary check
    if (ix < nx && iy < ny)
    {
        // Load data from global memory to shared memory
        tile[threadIdx.y][threadIdx.x] = in[ti];
    }

    // Thread synchronization
    __syncthreads();

    // Store data to global memory from shared memory
    if (trans_ix < ny && trans_iy < nx)
    {
        out[to] = tile[icol][irow];
    }
}