#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeSmemDyn(float *out, float *in, int nx, int ny)
{
    // Dynamic shared memory allocation
    extern __shared__ float tile[];

    // Global coordinates in original matrix
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Linear global memory index for original matrix
    unsigned int ti = iy * nx + ix;

    // Share memory indices within the block
    unsigned int sharedX = threadIdx.x;
    unsigned int sharedY = threadIdx.y;

    // Transposed block coordinates
    unsigned int transIx = blockDim.y * blockIdx.y + sharedX;
    unsigned int transIy = blockDim.x * blockIdx.x + sharedY;

    // Linear global memory index for transposed matrix
    unsigned int to = transIy * ny + transIx;

    // Transpose operation with boundary check
    if (ix < nx && iy < ny)
    {
        // Load data into shared memory from global memory
        tile[sharedY * blockDim.x + sharedX] = in[ti];

        // Synchronize threads for shared memory usage
        __syncthreads();

        // Store transposed data back to global memory
        out[to] = tile[sharedX * blockDim.y + sharedY];
    }
}