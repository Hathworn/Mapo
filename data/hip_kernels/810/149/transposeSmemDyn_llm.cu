#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeSmemDyn(float *out, float *in, int nx, int ny)
{
    // dynamic shared memory
    extern __shared__ float tile[];

    // coordinate in original matrix
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // linear global memory index for original matrix
    unsigned int ti = iy * nx + ix;

    // thread index in transposed block
    unsigned int row_idx = threadIdx.y * blockDim.x + threadIdx.x;
    unsigned int irow    = row_idx / blockDim.y;
    unsigned int icol    = row_idx % blockDim.y;
    unsigned int col_idx = icol * blockDim.x + irow;

    // coordinate in transposed matrix
    ix = blockDim.y * blockIdx.y + icol;
    iy = blockDim.x * blockIdx.x + irow;

    // linear global memory index for transposed matrix
    unsigned int to = iy * ny + ix;

    // transpose with boundary test
    if (ix < nx && iy < ny)
    {
        // load data from global memory to shared memory
        tile[row_idx] = in[ti];

        // thread synchronization
        __syncthreads();

        // store data to global memory from shared memory
        out[to] = tile[col_idx];
    }
}