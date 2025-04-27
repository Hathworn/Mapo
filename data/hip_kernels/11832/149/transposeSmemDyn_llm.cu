#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeSmemDyn(float *out, float *in, int nx, int ny)
{
    // Dynamic shared memory allocation
    extern __shared__ float tile[];

    // Calculate index for input matrix
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Linear index for global memory in input matrix
    if (ix < nx && iy < ny)
    {
        unsigned int ti = iy * nx + ix;

        // Reorder thread index for transposed access
        unsigned int row_idx = threadIdx.y * blockDim.x + threadIdx.x;
        unsigned int irow    = row_idx / blockDim.y;
        unsigned int icol    = row_idx % blockDim.y;
        unsigned int col_idx = icol * blockDim.x + irow;

        // Calculate index for output(transposed) matrix
        ix = blockDim.y * blockIdx.y + icol;
        iy = blockDim.x * blockIdx.x + irow;

        // Load data from global memory to shared memory
        tile[row_idx] = in[ti];

        // Synchronize to ensure all data is loaded
        __syncthreads();

        // Linear index for global memory in output matrix
        if (ix < nx && iy < ny)
        {
            unsigned int to = iy * ny + ix;
            // Store data from shared memory to global memory
            out[to] = tile[col_idx];
        }
    }
}