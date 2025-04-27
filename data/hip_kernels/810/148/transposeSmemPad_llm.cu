#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeSmemPad(float *out, float *in, int nx, int ny)
{
    // Use static shared memory with padding
    __shared__ float tile[BDIMY][BDIMX + IPAD];

    // Get x and y coordinates in original matrix
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Calculate global memory index for original matrix
    unsigned int ti = iy * nx + ix;

    // Transpose matrix indices using optimized thread calculation
    // Determine thread index within the transposed block
    unsigned int irow = threadIdx.x;
    unsigned int icol = threadIdx.y;

    // Calculate coordinates in transposed matrix
    unsigned int tix = blockDim.y * blockIdx.y + icol;
    unsigned int tiy = blockDim.x * blockIdx.x + irow;

    // Calculate linear global memory index for transposed matrix
    unsigned int to = tiy * ny + tix;

    // Only proceed if within matrix bounds
    if (ix < nx && iy < ny)
    {
        // Load data from global memory to shared memory
        tile[icol][irow] = in[ti];

        // Synchronize threads for consistent shared memory access
        __syncthreads();

        // Store transposed data to global memory from shared memory
        out[to] = tile[threadIdx.y][threadIdx.x];
    }
}