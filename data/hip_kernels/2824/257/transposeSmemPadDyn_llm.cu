#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeSmemPadDyn(float *out, float *in, int nx, int ny)
{
    // Static shared memory with padding
    extern __shared__ float tile[];

    // Coordinate in original matrix
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Linear global memory index for original matrix
    unsigned int ti = iy * nx + ix;

    // Thread index in transposed block
    unsigned int row_idx = threadIdx.y * (blockDim.x + IPAD) + threadIdx.x;
    unsigned int col_idx = threadIdx.x * (blockDim.y + IPAD) + threadIdx.y;

    // Coordinate in transposed matrix
    unsigned int trx = blockDim.y * blockIdx.y + threadIdx.x;
    unsigned int tryy = blockDim.x * blockIdx.x + threadIdx.y;

    // Linear global memory index for transposed matrix
    unsigned int to = tryy * ny + trx;

    // Transpose with boundary test
    if (ix < nx && iy < ny)
    {
        // Load data from global memory to shared memory
        tile[row_idx] = in[ti];

        // Thread synchronization
        __syncthreads();

        // Store data to global memory from shared memory
        if (trx < ny && tryy < nx)
        {
            out[to] = tile[col_idx];
        }
    }
}